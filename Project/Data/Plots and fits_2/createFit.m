function [fitresult, gof] = createFit(acceleration, velocity, torque)
%CREATEFIT(ACCELERATION,VELOCITY,TORQUE)
%  Create a fit.
%
%  Data for 'Fit Force Feedback' fit:
%      X Input : acceleration
%      Y Input : velocity
%      Z Output: torque
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 10-Dec-2021 21:24:13


%% Fit: 'Fit Force Feedback'.
[xData, yData, zData] = prepareSurfaceData( acceleration, velocity, torque );

% Set up fittype and options.
ft = fittype( 'poly11' );

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft );

% Plot fit with data.
figure( 'Name', 'Fit Force Feedback' );
h = plot( fitresult, [xData, yData], zData );
legend( h, 'Fit Force Feedback', 'torque vs. acceleration, velocity', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'acceleration', 'Interpreter', 'none' );
ylabel( 'velocity', 'Interpreter', 'none' );
zlabel( 'torque', 'Interpreter', 'none' );
grid on


