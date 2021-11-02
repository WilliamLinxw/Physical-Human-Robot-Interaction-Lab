data = xlsread('motor_voltage_current_torque.xlsx'); 
voltage = data(:,1);
current = data(:,2);
torque = data(:,3);



c1 = polyfit(voltage,current,1);
disp(['Equation is current = ' num2str(c1(1)) '*voltage + ' num2str(c1(2))]);
current_est = polyval(c1, voltage);

c2 = polyfit(voltage,torque,1);
disp(['Equation is torque = ' num2str(c2(1)) '*voltage + ' num2str(c2(2))]);
torque_est = polyval(c2, voltage);


yyaxis left
scatter(voltage, current);
ylabel('Motor current [A]');
xlabel('Input voltage [V]');
hold on
plot(voltage,current_est,'b--','LineWidth',2);
hold on
yyaxis right;
ylabel('Motor torque [mNm]');
scatter(voltage,torque);
hold on
plot(voltage,torque_est,'r--','LineWidth',2);
hold on
title('Motor current and motor torque dependent on input voltage');
legend('Measured output [A] dependent on input [V]', 'Transfer function for motor current', 'Expected output [mNm] dependent on input [V]', 'Transfer function for motor torque', 'Location', 'southoutside', 'Orientation', 'vertical');