initialization

%% Create car specific forces
% Velocity resolution, in dm/s
V_res = 1:1:130; %0.1 to 13m/s 
% Initialize look up table F_look_up(V_initial,V_final)
F_look_up = zeros(V_res,V_res);

% Fill in force requirements from V_initial to V_final
for V_i_step = 1:V_res-1
    % Scale to m/s
    V_initial = V_i_step*0.1;
    
    for V_f_step = 1:V_res-1
        % Scale to m/s
        V_final = V_f_step*0.1;
    
        % Force required for the change in velocity 
        V_look_up(V_i_step,V_f_step) = 
        
    end
end