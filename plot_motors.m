figure(2);
title('Motor 1');
plot(t,m1_desired_current,t,m1_measured_current,t,m1_el_energy);
legend('desired current (amps)','measured current (amps)','electrical energy (watt)');
grid on
xlabel('time (s)');
ylabel('unit');

figure(3);
title('Motor 2');
plot(t,m2_desired_current,t,m2_measured_current,t,m2_el_energy);
legend('desired current (amps)','measured current (amps)','electrical energy (watt)');
grid on
xlabel('time (s)');
ylabel('unit');