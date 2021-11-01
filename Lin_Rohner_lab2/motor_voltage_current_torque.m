data = xlsread('motor_voltage_current.xlsx'); 
voltage = data(:,1);
current = data(:,2);
torque = data(:,3);



c1 = polyfit(voltage,current,1);
disp(['Equation is current = ' num2str(c1(1)) '*voltage + ' num2str(c1(2))]);
current_est = polyval(c1,voltage);

c2 = polyfit(voltage,torque,1);
disp(['Equation is current = ' num2str(c2(1)) '*voltage + ' num2str(c2(2))]);
torque_est = polyval(c2,voltage);


yyaxis left
plot(voltage, current);
hold on
plot(voltage,current_est,'g--','LineWidth',2);
hold on
yyaxis right;
plot(voltage,torque)
hold on
plot(voltage,torque_est,'r--','LineWidth',2);