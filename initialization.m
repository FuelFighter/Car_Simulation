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

% Motor Limits
Motor1.max_current = 3*Motor1.nom_current;
Motor2.max_current = 3*Motor2.nom_current;
m1_volt_limit = 48;
m2_volt_limit = 48;

%Simulation Parameters
simulation_time = 142;
desired_velocity = 7;
drivetrain_loss = 0.95;

Gr_1 = 15;
Gr_2 = 15;

%Velocity Controll

zeta = 1;                   % Damping factor
omega_b = 0.1;              % Controller Bandwidth, how fast should the controller react. 0.1 is 10 times a second. 
omega_n =  omega_b/(sqrt(1-2*zeta^2+sqrt(4*zeta^4-4*zeta^2+2)));   % Bandwidth of the complete system
Kp_vel = 170; %omega_n^2 * M_c;
d = C_c + (3/7);            % Simplified linearization of the nonlinear aerodynamic drag
Kd_vel = 0;%2*zeta*omega_n*M_c - d;
Ki_vel = 0.00015;%omega_n*Kp_vel/10;

%Torque Controllers
response_time = 0.01; %
omega_c = 1/response_time;
Kr_m = 0;%omega_c * Motor1.inductance - Motor1.resistance;
Kp_m = 15*omega_c * Motor1.inductance;
Ki_m = omega_c * Motor1.resistance;
    
Kp_m1 = Kp_m; %200*Motor1.inductance;
Ki_m1 = Ki_m; %200*Motor1.resistance;

Kp_m2 = Kp_m; %200*Motor2.inductance;
Ki_m2 = Ki_m; %200*Motor2.resistance;

load('track2018_only_values.xlsx - Munka1.csv')
track = [track2018_only_values_xlsx___Munka1(:,3),track2018_only_values_xlsx___Munka1(:,4)];
track_parameters

Energysweep
