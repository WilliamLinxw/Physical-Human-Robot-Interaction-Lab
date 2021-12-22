data = xlsread('different_velocity_measurement.xlsx'); 
time = data(:,1);
vel_raw = data(:,2);
vel_filt_on = data(:,3);
tacho_raw = data(:,4);
tacho_filt_on = data(:,5);


%Position plot
figure(1)
p = plot(time, tacho_raw, '-.g', time, tacho_filt_on, '-', time, vel_raw, '-b', time, vel_filt_on, '--r', 'LineWidth', 1.2);
p(2).Color = [0.4940 0.1840 0.5560];
ylim([-4 6])
title('Performance of Different Velocity Measurement', 'FontSize', 30);
xlabel('Time [s]', FontSize=30);
ylabel('Angular Velocity [rad/s]',FontSize=30);
legend('By tachometer raw [rad/s]', 'By tachometer filtered [rad/s]', 'By derivative raw [rad/s]','By derivative filtered [rad/s]', 'Location', 'southoutside', 'Orientation', 'vertical', "Fontsize", 16);
grid