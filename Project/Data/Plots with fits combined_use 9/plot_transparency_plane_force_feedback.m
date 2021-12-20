data_uc = xlsread("uncontrolled.xlsx");
data_fg = xlsread("fg_compensated.xlsx");
data_ff = xlsread("force_feedback.xlsx");

torque_uc = data_uc(:,1);
acceleration_uc = data_uc(:,2);
velocity_uc = data_uc(:,3);

torque_fg = data_fg(:,1);
acceleration_fg = data_fg(:,2);
velocity_fg = data_fg(:,3);

torque_ff = data_ff(:,1);
acceleration_ff = data_ff(:,2);
velocity_ff = data_ff(:,3);

fit_uc = createFit(acceleration_uc, velocity_uc, torque_uc);
fit_fg = createFit(acceleration_fg, velocity_fg, torque_fg);
fit_ff = createFit(acceleration_ff, velocity_ff, torque_ff);

figure('Name','Transparency Planes','NumberTitle','off');
sgtitle('Measurements for Transparency Planes');
subplot(1,3,1);
p_uc = plot3(acceleration_uc, velocity_uc, torque_uc, '.', 'Color', 'black','MarkerSize',0.5);
title('Uncontrolled')
xlabel('Acceleration [rad/s^2]');
ylabel('Velocity [rad/s]');
zlabel('Torque [Nm]');
legend(p_uc, 'Torque vs. Acceleration, Velocity');
grid on

subplot(1,3,2);
plot3(acceleration_fg, velocity_fg, torque_fg, '.', 'Color', 'black','MarkerSize',0.5);
title('Force and Gravity Compensated')
xlabel('Acceleration [rad/s^2]');
ylabel('Velocity [rad/s]');
zlabel('Torque [Nm]');
grid on

subplot(1,3,3);
plot3(acceleration_ff, velocity_ff, torque_ff, '.', 'Color', 'black','MarkerSize',0.5);
title('Force Feedback');
subtitle('Feedback gain: kf = 10');
xlabel('Acceleration [rad/s^2]');
ylabel('Velocity [rad/s]');
zlabel('Torque [Nm]');
grid on


% Plot fit with data.
figure( 'Name', 'Transparency Planes','NumberTitle','off' );
sgtitle('Transparency Planes');
subplot(1,3,1);
p_fit_uc = plot(fit_uc, [acceleration_uc, velocity_uc], torque_uc);
title('Uncontrolled')
legend( p_fit_uc, 'Fit Transparency Planes', 'Torque vs. Acceleration, Velocity', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'Acceleration [rad/s^2]', 'Interpreter', 'none' );
ylabel( 'Velocity [rad/s]', 'Interpreter', 'none' );
zlabel( 'Torque [Nm]', 'Interpreter', 'none' );
grid on

subplot(1,3,2);
p_fit_fg = plot( fit_fg, [acceleration_fg, velocity_fg], torque_fg);
title('Force and Gravity Compensated')
% Label axes
xlabel( 'Acceleration [rad/s^2]', 'Interpreter', 'none' );
ylabel( 'Velocity [rad/s]', 'Interpreter', 'none' );
zlabel( 'Torque [Nm]', 'Interpreter', 'none' );
grid on

subplot(1,3,3);
p_fit_ff = plot( fit_ff, [acceleration_ff, velocity_ff], torque_ff);
title('Force Feedback')
subtitle('(Feedback Gain: KF = 1.15)');
% Label axes
xlabel( 'Acceleration [rad/s^2]', 'Interpreter', 'none' );
ylabel( 'Velocity [rad/s]', 'Interpreter', 'none' );
zlabel( 'Torque [Nm]', 'Interpreter', 'none' );
grid on
