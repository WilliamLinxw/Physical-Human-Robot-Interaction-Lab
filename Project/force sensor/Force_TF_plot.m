clc;
clear all;

% Read the data file
data = xlsread('transfer function put together');

% Get the first row as the position data from 0 gramms to 1062 gramms
weight = data(1,:);

force = weight * 9.81;

% Get the size of the dataset
[row, column] = size(data);

% Calculate the mean of all data acquired associated to the same position
voltage = [];
for i = 1:column
    voltage = [voltage, mean(data(2:1415, i))];    
end

voltage = voltage - 0.118712;
% Scatter Plot
scatter(voltage, force);
ylabel('Force [N]', FontSize=30);
xlabel('Voltage [V]', FontSize=30);
hold on

% Get the transfer function voltage = a * force + b
c = polyfit(voltage,force,1);

% Display the transfer function
disp(['Equation for force = ' num2str(c(1)) '*voltage + ' num2str(c(2))]);

% Generate the estimate value according to the transfer function for each
% position
force_est = polyval(c,voltage);

% Add trend line to plot
hold on
plot(voltage,force_est,'r--','LineWidth', 3);

text(0, 10 ,'Force(N) = 3.5855*Volt(V) + 0.057404', 'FontSize',20);
title('Transfer Function of the Force Sensor', FontSize=30);
legend('Measured output [V] dependent on input [N]', 'Transfer function', 'Location', 'southoutside', 'Orientation', 'vertical', 'Fontsize', 16);
