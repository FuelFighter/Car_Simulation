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

%% Non Linear Model
M_c = car_mass + car_tire_inertia; C_c = aero_c; N_c = car_roll_friction; D_c = car_mass*gravity; B_c = 1/car_tire_rad;    

%% Load Smoothed Out Track

load('track_angles.mat');