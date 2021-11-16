data = xlsread('data_3b_p2_signal1_all.xlsx');
time = data(:,1);
desired = data(:,2);
actual = data(:,3);
actual_setpoint = data(:,4);

plot(time, desired, time, actual, time, actual_setpoint);
ylabel("Desired and Actual Paddle Position [deg]");
xlabel("Time [sec]");
hold on
title("PID Response on Input Signal 1 Comparison")
legend("Desired Paddle Position [deg]", "Actual Paddle Position [deg]", "Actual Paddle Position (setpoint weighted) [deg]", "Location", "southoutside", "Orientation", "vertical");