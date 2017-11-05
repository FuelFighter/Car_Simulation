close all
% Compare
figure(1)
plot(pos,velocity,pos,v_d*ones(1,length(time)),'--',pos,motor_torque,pos,gravity_disturbance,pos,0.1*d_torque,'linewidth',1.5);
legend('vel, m/s','25 km/h','motor torque, Nm','gravity disturb, N','desired torque, Nm');
xlim([0 1660]);
grid on
% Compare
figure(2)
plot(time,velocity,time,v_d*ones(1,length(time)),'--',time,motor_torque,time,gravity_disturbance,time,0.1*d_torque,time,motor_torque1,time,motor_torque2,time,motor_input1,time,motor_input2,'linewidth',1.5);
legend('vel, m/s','25 km/h','motor torque, Nm','gravity disturb, N','desired torque, Nm','motor1','motor2','voltage 1','voltage 2');
xlim([0 1660]);
grid on