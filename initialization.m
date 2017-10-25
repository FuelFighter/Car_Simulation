clear all;
close all;

%% Car Parameters
car_mass = 95;
car_cd = 0.16;
car_rho = 1.225;
car_aero_area = 0.5;
car_roll_friction = 0.01;
car_tire_rad = 0.55/2;
car_driver_mass = 70;

gravity = 9.81;

%% State Space Model, linearized
A = -1/car_mass*car_rho*car_aero_area*car_cd - car_roll_friction;
B = 1/(car_mass*car_tire_rad);

%% Motor Parameters Re50
Vn_1 = 48; 			% Nominal Voltage
In_1 = 4.58;		% Nominal Current
Nn_1 = 4620;		% Nominal RPM
N0_1 = 4900; 		% No Load RPM
I0_1 = 0.0884; 		% No Load Current, A
R_1 = 0.608; 		% Winding Resistance, Ohm
L_1 = 0.423; 		% Inductance, mHenry
Kv_1 = 102;			% Speed constant, rpm/V
Ki_1 = 0.0934;		% Torque constant, Nm/A
Tm_1 = 3.78;		% Mechanical Time Constant, ms
Inert_1 = 542;      % Rotor Inertia, gcm^2

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

load('smooth_track.mat');

sim('simpleCarModel.slx');

plot(simout.data(:,2),simout.data(:,1))
xlim([0 1660]);
hold on
plotTrack = downsample(smooth_track_cubic,100);
plot(plotTrack(:,2));