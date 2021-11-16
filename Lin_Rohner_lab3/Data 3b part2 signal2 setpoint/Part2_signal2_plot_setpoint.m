data = xlsread('data_3b_signal2_setpoint');
time = data(:,1);
desired = data(:,2);
actual = data(:,3);

plot(time, desired, time, actual);
ylabel("Desired and Actual Paddle Position [deg]");
xlabel("Time [sec]");
hold on
title("PID Response on Input Signal 2 (setpoint weighted)")
legend("Desired Paddle Position [deg]", "Actual Paddle Position [deg]", "Location", "southoutside", "Orientation", "vertical");