close all
% Compare
figure(2)
plot(pos,velocity,pos,v_d*ones(1,length(time)),'--',pos,motor_torque,pos,gravity_disturbance,'linewidth',1.5);
legend('vel, m/s','25 km/h','motor torque, Nm','gravity disturb, N');
xlim([0 1660]);
grid on