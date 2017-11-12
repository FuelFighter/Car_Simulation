initialization
sim nonlinearCarModel.slx

% Plot motor
plot(t,m1_desired,'--',t,m1_measured,t,m1_error,t,m1_vin,t,m1_emf,t,motor_torque);
grid on
legend('d current','m current','error current','voltage in','back emf','applied torque')
