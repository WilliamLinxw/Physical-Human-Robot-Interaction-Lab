data = xlsread('data_3b.xlsx');
time = data(:,1);
desired = data(:,2);
actual = data(:,3);

time = time(2900:3600);
desired = desired(2900:3600);
actual = actual(2900:3600);

plot(time, desired, time, actual);
ylabel("Desired and Actual Paddle Position [deg]");
xlabel("Time [sec]");
hold on

% Get the rise time
for i = 1:length(time)
    if desired(i) >= 1
        change_time = time(i-1);
        break
    end
end
line([change_time, change_time], [0, -1], 'color', 'black')

% Calculate the rising time
for i = 1:length(time)
    if actual(i) >= 9
        t90 = time(i);
        index = i;
        break
    end
end
line([t90, t90], [actual(index), -0.5], 'color', 'black')


rise_time = t90 - change_time;
txt_rt = ['Rise time: ' num2str(rise_time)];
text(change_time-0.38,-0.32,txt_rt,'FontSize',12);

% Get the settling time
for i = 0:length(time)-1
    if actual(length(time) - i) >= 10.2
        settled_time = time(length(time)-i);
        index_settled = length(time) - i;
        break
    end
end
settling_time = settled_time - change_time;
line([settled_time+0.0036, settled_time+0.0036], [10.2, -1], 'color', 'black')

txt_st = ['Settling time: ', num2str(settling_time)];
text(settled_time+0.02,-0.7,txt_st,'FontSize',12);

% Draw error bands
upperband = 10.2;
lowerband = 9.8;
upper = yline(upperband, 'r--');
txt_ueb = ['Upper error band: ' num2str(upperband)];
text(17,10.6,txt_ueb,'FontSize',12);
lower = yline(lowerband, 'r--');
txt_leb = ['Lower error band: ' num2str(lowerband)];
text(17,9.5,txt_leb,'FontSize',12);

% Draw overshoot
max_value = max(actual);
overshoot = max_value - 10;
overshoot_line = yline(max_value, 'g--');
txt_max = ['Overshoot:' num2str(max_value)];
text(16,13.3,txt_max,'FontSize',12);

title("PID tuning step function")
legend("Desired Paddle Position [deg]", "Actual Paddle Position [deg]", "Upper error band = 10.2", "Lower error band = 9.8", "Overshoot", "Location", "southoutside", "Orientation", "vertical");