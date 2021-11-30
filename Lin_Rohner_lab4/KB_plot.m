data = xlsread("KB_plot_off.xlsx");

K = data(:,1);
B = data(:,2);

plot(B, K, '-x');

xlabel("B [Nm*s/rad]")
ylabel("K [Nm/rad]")
title("K-B plot without compensation")