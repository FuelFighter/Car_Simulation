function [force] = carDynamics(V_initial,V_final,distance)
%carDynamics calculates the force required to move the car from and inital
%velocity to a final one over a certain distance. SI units for velocity and distance.
%Assumes constant acceleration for the given interval.

% Acceleration
a = (V_final^2 - V_initial^2) / (2 * distance);

% Time 
t = (V_final - V_initial)/a;


end

