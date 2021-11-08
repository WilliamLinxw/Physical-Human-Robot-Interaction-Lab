yyaxis left
plot(t, phi);
ylabel('Paddle Position [deg]');
xlabel('Time [sec]');
hold on
yyaxis right
plot(t, v_in);
ylabel('Motor Input Voltage [V]');
hold on
title('Simulink simulated Paddle Position dependent on Motor Input Voltage');
legend('Paddle Position [deg]', 'Motor Input Voltage [V]', 'Location', 'southoutside', 'Orientation', 'vertical');
