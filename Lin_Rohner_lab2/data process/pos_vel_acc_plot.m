data = xlsread('hall_sensor_speadsheet_pos_vel_acc.xlsx'); 
pos_raw = data(:,1);
pos_filt_on = data(:,2);
vel_raw = data(:,3);
vel_filt_on = data(:,4);
acc_raw = data(:,5);
acc_filt_on = data(:,6);
time = data(:,7);

%design lowpassfilter for Position
[b_p, a_p] = butter(2, 20/(200/2));
%design lowpassfilter for Velocity
[b_v, a_v] = butter(2, 40/(200/2));
%design lowpassfilter for Acceleration
[b_a, a_a] = butter(2, 60/(200/2));

%offline filtering
pos_filt_off = filtfilt(b_p, a_p, pos_raw);
vel_filt_off = filtfilt(b_v, a_v, vel_raw);
acc_filt_off = filtfilt(b_a, a_a, acc_raw);

%Position plot
figure(1)
plot(time, pos_raw, '-b', time, pos_filt_on, '--r', time, pos_filt_off, '-.g', 'LineWidth', 1.2);
title('Position [deg] measured by Hall-Sensor raw / online-filtered / offline-filtered');
xlabel('Time [s]');
ylabel('Position [deg]');
legend('Position raw [deg]','Position online-filtered [deg]', 'Position offline-filtered [deg]', 'Location', 'southoutside', 'Orientation', 'vertical');
grid

%Velocity plot
figure(2)
plot(time, vel_raw, '-b', time, vel_filt_on, '--r', time, vel_filt_off, '-.g', 'LineWidth', 1.2);
title('Velocity [deg/s] measured by Hall-Sensor raw / online-filtered / offline-filtered');
xlabel('Time [s]');
ylabel('Velocity [deg/s]');
legend('Velocity raw [deg/s]','Velocity online-filtered [deg/s]', 'Velocity offline-filtered [deg/s]', 'Location', 'southoutside', 'Orientation', 'vertical');
grid

%Acceleration plot
figure(3)
plot(time, acc_raw, '-b', time, acc_filt_on, '--r', time, acc_filt_off, '-.g', 'LineWidth', 1.2);
title('Acceleration [deg/s^2] measured by Hall-Sensor raw / online-filtered / offline-filtered');
xlabel('Time [s]');
ylabel('Acceleration [deg/s^2]');
legend('Acceleration raw [deg/s^2]','Acceleration online-filtered [deg/s^2]','Acceleration offline-filtered [deg/s^2]', 'Location', 'southoutside', 'Orientation', 'vertical');
grid