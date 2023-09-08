%Version 9 of the Lander Simulator; improved model, now including a
%non-zero thrust and variable fuel mass, as well as an additional drag
%force.
%Contains a Piecewise Linear (PWL) Desired Velocity plan to determine 
%desired velocity
%1 Initialise Lander structure

%1.1 Set the Model Parameters
state.fixedmass = 500; % kg Mass with no fuel
state.fuelmass = 1500; % kg
state.g = 9.81; % Acceleration due to gravity m s^-2
state.a = -state.g; % Acceleration m s^-2
state.v = -300; % Velocity m /s
state.h = 3000; % Height m
state.dh = 1; %Height interval m

state.t = 0; % Time s
state.dt = 0.1; % Step size ss
state.burnrate = 0.001;%kg/s^-1N^-1
state.drag = 1/3; %drag factor
state.slope = -0.1; %slope of the GetVD function
state.intercept = -1; %intercept of the GetVD function

gain = 1000;

%Define three co-ordinates for the lines to go through
Hpoints = [0 1000 2000 3000];  % In vector form X = [x1 x2 x3]
Vpoints = [-1 -190 -255 -300];  % and Y = [y1 y2 y3]

%Find intercepts and slopes, store as data structure lineCoeffs
lineCoeffs = points2pwl(Hpoints,Vpoints);

%1.2 Initialise vectors to store the data to plot.
tstart = 0; 
tend = 200;
dt = 0.1;
T = tstart:dt:tend; 
n = length(T);
H = zeros(1,n);
A = zeros(1,n);
V = zeros(1,n);
FM = zeros(1,n);
VD = zeros(1,n);

%2 Repeat for each time step while above the ground

k=0;
while (k < n && state.h > 0)
    
    k = k + 1;

    % 3 Store the data to plot later
    
    H(k) = state.h;
    V(k) = state.v;
    T(k) = state.t;
    A(k) = state.a;
    FM(k) = state.fuelmass;
    vdesired = PWLvalues(lineCoeffs,state.h);
    VD(k) = vdesired;

    % 4 Get the thrust from the controller
    thrust = ThrustControl(state,gain,vdesired);
    % 5 Run the simulator to predict what will happen over the next time
    % step
    state = simulator(thrust,state);
    
% 6 End of repeat
end


% 7 Plot the data
PlotGraphs(V,H,A,FM,T,k,VD)

% 8 Check the criteria for safe landing
CheckCriteria(A,V,FM,state,k)









