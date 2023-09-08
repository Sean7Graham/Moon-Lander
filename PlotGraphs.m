function[] = PlotGraphs(V,H,A,FM,T,k,VD) 
%PlotGraphs
%Plots graphs of each of the variables against time, all on one figure
    figure
    grid on
    sgtitle('Build9');
    hold on;

    T = T(1:k);
    V = V(1:k);
    H = H(1:k);
    A = A(1:k);
    FM = FM(1:k);
    VD = VD(1:k);

    subplot(4,1,1);
    plot(T,H,'r-');
    ylabel('height (m)');

    subplot(4,1,2);
    plot(T,V,'b-');
    hold on
    plot(T,VD,'k--');
    ylabel('vel (m/s)');
    title('Actual Velocity (solid line), Desired Velocity (dashed line)')

    subplot(4,1,3);
    plot(T,A,'g-');
    ylabel('accel (m/s^2)');

    subplot(4,1,4);
    plot(T,FM,'m-')
    xlabel('Time (s)')
    ylabel('fuel (kg)');
    hold on
    plot(T(k),FM(k),'xk')
    str = string(FM(k));
    text(T(k)-15,FM(k)+400,"Final Mass = " + str +"kg at " + string(T(k))+'s')
    %plots and labels final mass on graph, at the time it occurs

   
end



