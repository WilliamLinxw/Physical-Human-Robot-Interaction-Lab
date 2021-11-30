data = xlsread("KB_plot_off.xlsx");

K = data(:,1);
B = data(:,2);

area(B, K, FaceColor=[209/255 196/255 233/255])
hold on
plot(B, K, '-x', LineWidth=1, Color='b');

ylim([0 5])
xlim([0 0.09])
xlabel("B [Nm*s/rad]", 'FontSize', 12)
ylabel("K [Nm/rad]", 'FontSize', 12)
title("K-B plot without compensation", 'FontSize', 12)

z_width = sum(K(2:length(K)) + K(1:length(K)-1))/2 * (0.08/6)
txt_off = ['Z-Width: ', num2str(z_width), ' [(Nm)^2s/(rad)^2]'];
text(0.04, 4, txt_off,'FontSize',12);