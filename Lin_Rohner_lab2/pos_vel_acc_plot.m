data = xlsread('hall_sensor_speadsheet_pos_vel_acc.xlsx'); 
pos_raw = data(:,1);
pos_filt_on = data(:,2);
vel_raw = data(:,3);
vel_filt_on = data(:,4);
acc_raw = data(:,5);
acc_filt_on = data(:,6);
time = data(:,7);

%design lowpassfilter for Position
d_pos = designfilt('lowpassfir', 'FilterOrder', 2, 'CutoffFrequency', .125, 'SampleRate', 10);
%design lowpassfilter for Velocity
d_vel = designfilt('lowpassfir', 'FilterOrder', 2, 'CutoffFrequency', .125, 'SampleRate', 10);
%design lowpassfilter for Acceleration
d_acc = designfilt('lowpassfir', 'FilterOrder', 2, 'CutoffFrequency', 5, 'SampleRate', 10);

%offline filtering
pos_filt_off = filtfilt(d_pos, pos_raw);
vel_filt_off = filtfilt(d_vel, vel_raw);
acc_filt_off = filtfilt(d_acc, acc_raw);

%Position plot
% plot(time,pos_raw, time, pos_filt_on, time, pos_filt_off);
% title('Position [deg] measured by Hall-Sensor raw / online-filtered / offline-filtered');
% xlabel('Time [s]');
% ylabel('Position [deg]');
% legend('Position raw','Position online-filtered', 'Position offline-filtered');

% %Velocity plot
% plot(time, vel_raw, time, vel_filt_on, time, vel_filt_off);
% title('Velocity [deg/s] measured by Hall-Sensor raw / online-filtered / offline-filtered');
% xlabel('Time [s]');
% ylabel('Velocity [deg/s]');
% legend('Velocity raw','Velocity online-filtered', 'Velocity offline-filtered');
% 
%Acceleration plot
plot(time, acc_raw, time, acc_filt_on, time, acc_filt_off);
title('Acceleration [deg/s^2] measured by Hall-Sensor raw / online-filtered / offline-filtered');
xlabel('Time [s]');
ylabel('Acceleration [deg/s^2]');
legend('Acceleration raw','Acceleration online-filtered','Acceleration offline-filtered');
