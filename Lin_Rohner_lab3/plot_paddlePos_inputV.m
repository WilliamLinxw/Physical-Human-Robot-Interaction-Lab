data = xlsread('position_time_sinusoid.xlsx'); 
voltage = data(:,1);
time = data(:,2);
position = data(:,3);

yyaxis left
plot(time, position);
ylabel('Paddle Position [deg]');
xlabel('Time [sec]');
hold on
yyaxis right
plot(time, voltage);
ylabel('Motor Input voltage [V]');
title('Paddle Position dependent on Motor Input voltage');
legend('Paddle Position [deg]', 'Motor Input Voltage [V]', 'Location', 'southoutside', 'Orientation', 'vertical');
