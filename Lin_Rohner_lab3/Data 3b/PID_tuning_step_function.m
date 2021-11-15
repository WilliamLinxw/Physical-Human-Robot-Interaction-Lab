data = xlsread('data_3b.xlsx');
time = data(:,1);
desired = data(:,2);
actual = data(:,3);

plot(time, desired, time, actual);
ylabel("Desired and Actual Paddle Position (deg)");
xlabel("Time (s)");
hold on

max_value = max(actual);
overshoot = max_value - 10;

upperband = 10.2;
lowerband = 9.8;

upper = yline(upperband, 'r--');
lower = yline(lowerband, 'r--');
overshoot_line = yline(max_value, 'g--');

title("PID tuning step function")
legend("Desired Paddle Position [deg]", "Actual Paddle Position [deg]", "Upper error band = 10.2", "Lower error band = 9.8", "Max value", "Location", "southoutside", "Orientation", "vertical");