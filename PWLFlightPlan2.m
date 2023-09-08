% A script to plot a piecewise linear flight plan

% Define three co-ordinates for the lines to go through
Hpoints = [0,1000,2000,3000]; % In vector form X = [x1 x2 x3]

for l2 = -300:20:-200
    for l1 = -200:50:-50
        Vpoints = [-1, l1, l2,-300];
            

%  Find intercepts and slopes, store as data structure lineCoeffs
        lineCoeffs = points2pwl(Hpoints,Vpoints);

% For full range of heights (m), find the corresponding velocities (m/s), using function getPWLval
        heights = 0:1:3000;
        vdesired = getPWLval(lineCoeffs,heights);
    

% Plot the flight plan
        hold on
        plot(heights,vdesired,'k'); 
        xlabel('height (m)')
        ylabel('desired velocity (m/s)')
        grid 

% Plot 3 original points to show fixed points where lines should pass through
        hold on
        plot(Hpoints,Vpoints,'ro','MarkerSize',10)
        title({'PWL Flight Plan'})
    end
end
