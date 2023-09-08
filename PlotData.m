function[] = PlotData(Amax,Vend,Mend,V1000,V2000) 
%PlotData
%Plots graphs of each of the variables against velocity at 2000m, for each
%value of velocity at 1000m
 
    grid on
    sgtitle(['Multiple PWLs: Gain 1000']);
    hold on;

    hold on
    subplot(3,1,1);
    plot(V2000,Amax,'x-','DisplayName',num2str(V1000(1,1)))
    ylabel('Max Acceleration (m/s^2)');
    legend

    hold on
    subplot(3,1,2);
    plot(V2000,Vend,'x-','DisplayName',num2str(V1000(1,1)))
    ylabel('Landing Velocity (m/s)');
    legend
    
    hold on
    subplot(3,1,3);
    plot(V2000,Mend,'x-','DisplayName',num2str(V1000(1,1)))
    xlabel('Desired velocity at 2000m at different values of V1000 (m/s)')
    ylabel('Final Mass of Fuel (kg)');
    legend

end


