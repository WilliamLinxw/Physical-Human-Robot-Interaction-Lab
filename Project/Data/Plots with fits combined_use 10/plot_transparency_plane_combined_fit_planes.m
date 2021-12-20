
% Plot fit with data.
figure( 'Name', 'Fit Transparency Planes','NumberTitle','off' );
sgtitle('Transparency Planes with Fits');
f_uc = @(acceleration_uc,velocity_uc,torque_uc) 0.002526 + -0.0007852*acceleration_uc + 0.008958*velocity_uc - torque_uc;
interval = [-100 100 -5 5 -0.15 0.15];
p_uc = fimplicit3(f_uc, interval);
p_uc.FaceColor = 'r';
p_uc.EdgeColor = 'r';
% p_uc.FaceAlpha = 0.3;
% Label axes
xlabel( 'Acceleration [rad/s^2]', 'Interpreter', 'none' );
ylabel( 'Velocity [rad/s]', 'Interpreter', 'none' );
zlabel( 'Torque [Nm]', 'Interpreter', 'none' );
grid on
hold on
f_fg = @(acceleration_fg,velocity_fg,torque_fg) 0.003488 + -0.0008166*acceleration_fg + 0.005411*velocity_fg - torque_fg;
interval = [-100 100 -5 5 -0.15 0.15];
p_fg = fimplicit3(f_fg, interval);
p_fg.FaceColor = 'g';
p_fg.EdgeColor = 'g';
% p_fg.FaceAlpha = 0.3;
hold on
f_ff = @(acceleration_ff,velocity_ff,torque_ff) 0.001954 + -0.0005468*acceleration_ff + 0.004377*velocity_ff - torque_ff;
interval = [-100 100 -5 5 -0.15 0.15];
p_ff = fimplicit3(f_ff, interval);
p_ff.FaceColor = 'y';
p_ff.EdgeColor = 'y';
% p_fg.FaceAlpha = 0.3;
hold off 
legend('Fit Transparency Plane Uncontrolled','Fit Transparency Plane Friction and Gravity Compendated', 'Fit Transparency Plane Force Feedback')
