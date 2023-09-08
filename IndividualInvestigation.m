%investigatePWLs
%program which tests different flight plans using the lander script in a
%function, plotting the different velocities at 1500m against the three outputs of the
%LanderFunc function.

figure

%Define test range of data
maxv1 = -200;
minv1 = -110;
maxv2 = -300;
minv2 = -200;
dv1 = 15; 
dv2 = 10;
rangev1 = abs(maxv1) - abs(minv1);
rangev2 = abs(maxv2) - abs(minv2);


sizev1 = rangev1/(dv1); %number of velocities being tested
sizev2 = rangev2/(dv2);

% Initialise vectors to store data to plot

Amax = zeros(sizev2,sizev1); %max acceleration, m/s^2
Vend = zeros(sizev2,sizev1); %final velocity, m/s
Mend = zeros(sizev2,sizev1); %final fuel mass, kg
V1000 = zeros(sizev2,sizev1); %velocity at 1000m, m/s
V2000 = zeros(sizev2,sizev1); %velocity at 2000m, m/s


%2 Set up a while loop to test different values of velocity at 1500m
n=0;
m=1;
%while n < m
    %2.1 Set a for loop to repeat the collecting of data using the
    %LanderFunc function for the number of different velocities which
    %are being tested
    for l1 = -200:dv2:-110
        for l2 = -300:dv1:-200
            n = n+1;
            test.hpoints = [0 1000 2000 3000];
            test.vpoints = [-1 l1 l2 -300];
       
            [Amax(m,n),Vend(m,n),Mend(m,n)] = LanderFunc(test);
            V1000(m,n) = l1;
            V2000(m,n) = l2;
        end
        n = 0;

        %Plot V at 2000m against the three outputs of the LanderFunc
        %function, for each value of V at 1000m
     
        PlotData(Amax(m,:),Vend(m,:),Mend(m,:),V1000(m,:),V2000(m,:))
        m = m+1;

    end
%end

