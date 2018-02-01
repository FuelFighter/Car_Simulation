figure(1);
title('Motor 1');
plot(t,m1_desired_current,t,m2_measured_current,t,m2_volt_in,t,m2_el_energy);
legend('desired current (amps)','measured current (amps)','input voltage (volt)','electrical energy (watt)');
grid on
xlabel('time (s)');
ylabel('unit');