function [thrust] = ThrustControl(state,gain,vdesired)
%ThrustControl 
%Determines the required thrust at any point during during
%the lander's flight using a control system

Error = vdesired - state.v;  %computes the difference between current 
%velocity and desired velocity

thrust = gain*Error + state.g*(state.fuelmass + state.fixedmass);

end


