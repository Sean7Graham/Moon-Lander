function[accel] = GetAcceleration(thrust,state)
%GetAcceleration
%Solves for the next acceleration of the rocket as time progresses;
%calculates acceleration given current thrust and values of the 'state'
%structure

drag = -1*state.drag*abs(state.v)*state.v;

%5.1.1 Calculate the total mass
mass = state.fuelmass + state.fixedmass;

%5.1.2 Calculate the force
force = thrust - mass*(state.g) + drag;

%5.1.3 Use Newton's second law to calculate the acceleration
accel = (force)/mass;

end