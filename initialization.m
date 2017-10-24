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

%% State Space Model 
A = -1/car_mass*car_rho*car_aero_area*car_cd - car_roll_friction;
B = 1/(car_mass*car_tire_rad);

%% Motor Parameters Re50

%% Motor Paramteres Re65

%% Load Smoothed Out Track
load('smooth_track_angles.mat');

sim('simpleCarModel.slx');

plot(simout);