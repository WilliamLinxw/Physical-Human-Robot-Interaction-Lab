clc;
clear all;

% Read the data file
data = xlsread('Hall_sensor_TF');

% Get the first row as the position data from -32.5 degree to 32.5 degree
degree = data(1,:);

% Get the size of the dataset
[row, column] = size(data);

% Calculate the mean of all data acquired associated to the same position
voltage = [];
for i = 1:column
    voltage = [voltage, mean(data(2:1002, i))];    
end

% Scatter Plot
scatter(voltage, degree);
ylabel('Position (deg)');
xlabel('Voltage (V)');
hold on

% Get the transfer function voltage = a * position + b
c = polyfit(voltage,degree,1);

% Display the transfer function
disp(['Equation is degree = ' num2str(c(1)) '*voltage + ' num2str(c(2))]);

% Generate the estimate value according to the transfer function for each
% position
degree_est = polyval(c,voltage);

% Add trend line to plot
hold on
plot(voltage,degree_est,'r--','LineWidth',2);

text(0, -10 ,'P(degree) = 9.6312*Vol(V) + 0.16395');
title('Transfer Function of the Hall Sensor');
