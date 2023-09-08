function new = simulator(thrust,old)
%simulator
%outputs a new structure newstate based on the values of the current
%structure oldstate

new = old;

% 5.1 Ensures thrust is 0 when fuel runs out.
if old.fuelmass <= 0
    thrust = 0;
end
% 5.2 Calculate the Acceleration
new.a = GetAcceleration(thrust,new);

% 5.3 Use Euler's method to find the height at the next step
new.h = old.h + old.dt * old.v;

% 5.4 Use Euler's method to find the velocity at the next step
new.v = old.v + old.dt * old.a;

% 5.5 Use Euler's method to find the fuelmass at the next step
if(old.fuelmass > 0)
    new.fuelmass = old.fuelmass - abs(thrust)*(old.burnrate)*(old.dt);   
else
    new.fuelmass = 0; %prevents fuelmass from going below 0
end

% 5.6 Increase the time by dt
new.t = old.t + old.dt;

end
