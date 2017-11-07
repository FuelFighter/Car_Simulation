clear all;
close all;

%% Car Parameters

car_cd = 0.16;
car_rho = 1.225;
car_aero_area = 0.5;

car_roll_friction = 0.01;
car_tire_rad = 0.55/2;
car_tire_inertia = (0.204*4)/car_tire_rad^2;

car_driver_mass = 70;
car_vehicle_mass = 95;
car_mass = car_vehicle_mass + car_driver_mass;

aero_c = 0.5*car_rho*car_cd*car_aero_area;

gravity = 9.81;

%% State Space Model, linearized
A = -1/car_mass*car_rho*car_aero_area*car_cd - car_roll_friction;
B = 1/(car_mass*car_tire_rad);


%% Non Linear Model
M_c = car_mass + car_tire_inertia; C_c = aero_c; N_c = car_roll_friction; D_c = car_mass*gravity; B_c = 1/car_tire_rad;    

%% Testing parameters
T_sat = 5;
v_d = 25/3.6;

% Velocity Controller
Kp_vel = 1;
Ki_vel = 0.1;

% Electrical Characteristics
V_limit = 45;       % Voltage Limit
I_limit = 50;       % Current Limit

%% Motor Parameters Re50
Vn_1 = 48; 			% Nominal Voltage
In_1 = 4.58;		% Nominal Current
Nn_1 = 4620;		% Nominal RPM
N0_1 = 4900; 		% No Load RPM
I0_1 = 0.0884; 		% No Load Current, A
R_1 = 0.608; 		% Winding Resistance, Ohm
L_1 = 0.423; 		% Inductance, mHenry
Kv_1 = 102*2*pi/60; % Speed constant, rpm/V -> rad/s /V
Ki_1 = 0.0934;		% Torque constant, Nm/A
Tm_1 = 3.78;		% Mechanical Time Constant, ms
Inert_1 = 542;      % Rotor Inertia, gcm^2
Gr_1 = 10;          % Gear Ratio from wheel rotations to motor rotations
% PI controller for Re_50
Kp_re50 = 1000*L_1;
Ki_re50 = 1000*R_1;

%% Motor Paramteres Re65
Vn_2 = 48; 			% Nominal Voltage
In_2 = 6.8;			% Nominal Current
Nn_2 = 3420;		% Nominal RPM
N0_2 = 3670; 		% No Load RPM
I0_2 = 0.289; 		% No Load Current, A
R_2 = 0.365; 		% Winding Resistance, Ohm
L_2 = 0.161; 		% Inductance, mHenry
Kv_2 = 77.8;		% Speed constant, rpm/V
Ki_2 = 0.123;		% Torque constant, Nm/A
Tm_2 = 3.25;		% Mechanical Time Constant, ms
Inert_2 = 1340; 	% Rotor Inertia, gcm^2

%% Load Smoothed Out Track

load('track_angles.mat');
%sim('nonlinearCarModel.slx');
%plotting