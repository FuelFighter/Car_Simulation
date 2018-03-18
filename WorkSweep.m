
% div
total_dist = 940;
roll_friction_const = 0.0013;
cruise_vel = 8.2;
height = 2.1;

% Aero Dynamics
Aero_area = 0.882;
Aero_friction = 0.138;
rho = 1.225;
Aero_time_const = 104;

% Motor
motor_avg_efficiency = 0.77;
motor_bidirectional_efficiency = (1-motor_avg_efficiency)/motor_avg_efficiency;


mass = linspace(100,200);
acd = linspace(0.05,0.2);
[M,ACD] = meshgrid(mass,acd);


W_kin_loss = M*0.5*cruise_vel^2 * motor_bidirectional_efficiency;
W_air = ACD * rho * 0.5 * cruise_vel^3 * Aero_time_const;
W_roll = M * roll_friction_const * 9.81 * total_dist;
W_hill = (M * 9.81 * height)*(1-motor_avg_efficiency)/motor_avg_efficiency;

W_total = W_kin_loss + (W_air + W_roll)/motor_avg_efficiency + W_hill;

figure(2);
contour(M,ACD,W_total,30,'showtext','on')
xlabel('Total Mass');
ylabel('A * Cd');
xticks(100:10:200);
ytickformat('%.2f');
set(gca,'ytick',linspace(0.05,0.2,10));
grid on
hold on
plot(160,0.1217,'r*');
title('Total energy used for flat track');
