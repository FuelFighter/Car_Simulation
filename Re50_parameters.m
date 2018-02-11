%% Motor Parameters Re50
Re50 = Motor;
Re50.nom_volt = 48; 			% Nominal Voltage
Re50.nom_current = 4.58;		% Nominal Current
Re50.nom_torque = 0.420;        % Nominal Torque
Re50.nom_speed = 4620;          % Nominal RPM
Re50.no_load_speed = 4900; 		% No Load RPM
Re50.no_load_current = 0.0884; 		% No Load Current, A
Re50.resistance = 0.608; 		% Winding Resistance, Ohm
Re50.inductance = 0.423e-3;            % Inductance, mHenry
Re50.speed_constant = 102*2*pi/60;  % Speed constant, rpm/V -> rad/s /V
Re50.torque_constant = 0.0934;		% Torque constant, Nm/A
Re50.mech_time_constant = 3.78;     % Mechanical Time Constant, ms
Re50.rotor_inertia = 542;          % Rotor Inertia, gcm^2
% PI controller for Re_50
Kp_re50 = 100*Re50.inductance;
Ki_re50 = 100*Re50.resistance;