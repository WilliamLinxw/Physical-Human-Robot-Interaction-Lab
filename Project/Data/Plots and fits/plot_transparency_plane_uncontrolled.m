data = xlsread("Torque_Acceleration_Velocity_uncontrolled.xlsx");

torque = data(:,1);
acceleration = data(:,2);
velocity = data(:,3);

plot3(acceleration, velocity, torque, '.', 'Color', 'black');

xlabel('Acceleration');
ylabel('Velocity');
zlabel('Torque');

grid on
