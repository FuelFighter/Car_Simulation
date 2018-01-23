%% Motor Paramteres Re65
Re65 = Motor;		
Re65.nom_volt = 48;         % Nominal Voltage
Re65.nom_current = 6.8;		% Nominal Current
Re65.nom_speed = 3420;		% Nominal RPM
Re65.no_load_speed = 3670; 		% No Load RPM
Re65.no_load_current = 0.289; 		% No Load Current, A
Re65.resistance = 0.365; 		% Winding Resistance, Ohm
Re65.inductance = 0.161; 		% Inductance, mHenry
Re65.speed_constant = 77.8;		% Speed constant, rpm/V
Re65.torque_constant = 0.123;		% Torque constant, Nm/A
Re65.mech_time_constant = 3.25;		% Mechanical Time Constant, ms
Re65.rotor_inertia = 1340; 	% Rotor Inertia, gcm^2
% PI controller for Re_50
Kp_re50 = 100*Re65.inductance;
Ki_re50 = 100*Re65.resistance;