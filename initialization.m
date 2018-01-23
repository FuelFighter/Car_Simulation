clear all;
close all;

%% Car Parameters

car_cd = 0.138;
car_rho = 1.225;
car_aero_area = 0.882;

car_driver_mass = 70;
car_vehicle_mass = 90;
car_mass = car_vehicle_mass + car_driver_mass;

gravity = 9.81;
car_roll_friction = 0.0013*car_mass*gravity;
car_tire_rad = 0.556/2;
car_tire_inertia = (0.204*4)/car_tire_rad^2;

aero_c = 0.5*car_rho*car_cd*car_aero_area;


%% Non Linear Model
M_c = car_mass + car_tire_inertia; C_c = aero_c; N_c = car_roll_friction; D_c = car_mass*gravity; B_c = 1/car_tire_rad;    

% Electrical Characteristics
V_limit = 45;       % Voltage Limit
I_limit = 50;       % Current Limit
%% Motors
Re50_parameters;
Re65_parameters;

Motor1 = Re50;
Motor2 = Re50;
Motor1.max_current = 1*Motor1.nom_current;
Motor2.max_current = 1*Motor2.nom_current;

%Simulation Parameters
desired_torque = 100;
m1_volt_limit = 48;
m2_volt_limit = 48;

Gr_1 = 15;
Gr_2 = 15;

%Torque Controllers
Kp_m1 = 100*Motor1.inductance;
Ki_m1 = 100*Motor1.resistance;

%Torque Controllers
Kp_m2 = 100*Motor2.inductance;
Ki_m2 = 100*Motor2.resistance;

%% Load Smoothed Out Track

load('track_angles.mat');
%sim('nonlinearCarModel.slx');
%plotting