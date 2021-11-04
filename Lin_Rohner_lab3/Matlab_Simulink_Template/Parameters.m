% equation G':
s_1       = -0.4285; %            experiment Lab 2B
s_2       = 1.0677; %            experiment Lab 2B
V_0       = 2.4917; %            to be calculated

% equation G:
%Lm      = 0.00125; % [H]       motor datasheed
%Rm      = 10.6; % [Ohm]        motor datasheed
k_tau	= 0.0538; % [Nm/A]      motor datasheed
r_p1	= 0.075; % [m]          CAD
r_m     = 0.0043; % [m]         CAD (minor radius of M10 screw)

% equation H
J_p     = 2.20E-04; % [kg*m^2]  CAD
J_m     = 1.58E-06; % [kg*m^2]  CAD
B_p     = 0; % [Nm*s/rad]       experiment Lab 4A
B_m     = 7.90E-07; %[Nm*s/rad] motor datasheed
m_p     = 0.075; % [kg]         CAD
g       = 9.81; % [N/kg]
l       = 0.0199; % [m]         CAD
r_p2    = 0.065; % [m]          CAD

J_dash  = J_p + J_m * (r_p1/r_m)^2; % [kg*m^2]
B_dash  = B_p + B_m * (r_p1/r_m)^2; % [Nm*s/rad]
K_dash  = r_p1/r_m * k_tau; % [Nm/A]

% Lab4A:
%fr_static = 0.0105; %Nm        experiment Lab 4A
%delta_omega_dot = 1; % �/s