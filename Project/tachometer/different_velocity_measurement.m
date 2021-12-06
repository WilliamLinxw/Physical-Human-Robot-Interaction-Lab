data = xlsread('different_velocity_measurement.xlsx'); 
time = data(:,1);
vel_raw = data(:,2);
vel_filt_on = data(:,3);
tacho_raw = data(:,4);
tacho_filt_on = data(:,5);


%Position plot
figure(1)
plot(time, vel_raw, '-b', time, vel_filt_on, '--r', time, tacho_raw, '-.g', time, tacho_filt_on, 'LineWidth', 1.2);
ylim([-4 6])
title('Performance of Different Velocity Measurement', 'FontSize', 16);
xlabel('Time [s]', FontSize=16);
ylabel('Angular Velocity [rad/s]',FontSize=16);
legend('vel raw(derivative) [rad/s]','vel filt(derivative) [rad/s]', 'tacho raw [rad/s]', 'tacho filt [rad/s]', 'Location', 'southoutside', 'Orientation', 'vertical', "Fontsize", 12);
grid