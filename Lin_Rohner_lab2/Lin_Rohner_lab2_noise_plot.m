data = xlsread('hall_sensor_spreadsheet_noise_charaterization.xlsx'); 
position_deg = data(:,1);
position_volt = data(:,2);
time = data(:,3);
mean_position_deg = mean(data(:,1));
mean_position_volt = mean(data(:,2));
std_position_deg = std(data(:,1));
std_position_volt = std(data(:,2));

yyaxis left
plot(time, position_volt);
[t, s] = title('Signal with noise of the Hall-Sensor in [V] and [deg] after TF', ['Mean = ', num2str(mean_position_volt), ' volts ---> ', num2str(mean_position_deg), ' degrees' newline 'Standard deviation = ', num2str(std_position_volt), ' volts ---> ', num2str(std_position_deg), ' degrees']);
t.FontSize = 16;
s.Color = 'red';
s.FontAngle = 'italic';

xlabel('Time [s]');
ylabel('Voltage [V]');

yyaxis right
plot(time,position_deg);
ylabel('Position [deg]');

legend('Voltage [V]', 'Position [deg]' ,'Location', 'southoutside', 'Orientation', 'horizontal');










