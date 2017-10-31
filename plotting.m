close all
% Velocity
figure(1)
plot(time,velocity,time,vel_error,time,v_d*ones(1,length(time)),'--',time,motor_torque,'linewidth',1.5);
legend('velocity','vel error','v desired','motor torque');
grid on

% Compare
figure(2)
plot(pos,velocity,pos,v_d*ones(1,length(time)),'--',pos,motor_torque,pos,gravity_disturbance,pos,height,'linewidth',1.5);
legend('vel','vel d','motor torque','gravity disturb');
xlim([0 1660]);
grid on