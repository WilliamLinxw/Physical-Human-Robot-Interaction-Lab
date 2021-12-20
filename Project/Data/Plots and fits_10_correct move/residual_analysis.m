data = xlsread("force_feedback.xlsx");

torque = data(:,1);
acceleration = data(:,2);
velocity = data(:,3);

residuals = [];

for i = 1:length(torque)
    estimatetorque = 0.002526 - 0.0007852*acceleration(i) + 0.008958*velocity(i);
    residual = torque(i) - estimatetorque;
    residuals = [residuals, residual];
end

for i = 1:length(residuals)
    if residuals(i) < 0
        residuals(i) = -residuals(i);
    end
end

max_residual = max(residuals)
average_residual = mean(residuals)