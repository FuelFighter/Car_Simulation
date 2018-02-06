%% Simulate Different Speeds and Acceleration;
    
%% Velocity trajectory
max_vel = 9;
min_avg_vel = 6.71;
max_time = 140;   
        
delta_v = 0.01;

lowest = struct('max_vel',0,'c_time',0,'energy',999999);

results = struct('max_vel',zeros(100,1),'c_time',zeros(100,1),'energy',zeros(100,1));

%%
for n = 1:1:100
    c_time = 9;
    temp = 1000;
    
    max_vel = max_vel - delta_v;
    results.max_vel(n) = max_vel;
    
    vel_traj = [-1      0      c_time       max_time-c_time    max_time;   % time
                0       0      max_vel      max_vel       0      ];       % m/s 
    
    while temp > min_avg_vel
        vel_traj(1,3) = c_time;
        vel_traj(1,4) = 140-c_time;
        temp = 0;
        for i = 3:1:5
            temp = temp + ((vel_traj(2,i-1) + vel_traj(2,i))/2) * (vel_traj(1,i) - vel_traj(1,i-1)); 
        end 
        temp = temp/max_time;
        c_time = c_time + 0.05;
    end
    
    if temp < min_avg_vel-0.01
        fprintf("Not possible to drive so slow\n");
        break;
    end
    
    results.c_time(n) = c_time;
    fprintf("Cruise at: %is. Avg velocity %.2f m/s, Max velocity %.2f m/s\n",c_time,temp,max_vel);



    sim nonlinearCarModel
    
    results.energy(n) = alternative_motor_work(length(total_motor_work));
    if results.energy(n) < lowest.energy
        lowest.energy = results.energy(n);
        lowest.max_vel = results.max_vel(n);
        lowest.c_time = results.c_time(n);
    end
    
    
    fprintf("Energy used: %.f Joules\n",results.energy(n));

end
