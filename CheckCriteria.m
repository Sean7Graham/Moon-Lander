function [vLand,FuelLeft,maxAcc] = CheckCriteria(A,V,FM,state,k)
%CheckCriteria
%Function which checks critical criteria of the lander,
%to make sure it complys with design criteria

vLand = V(k);
FuelLeft = FM(k);
maxAcc = max(A);

check1 = -2 < V(k) && V(k) < 0;
if check1 == 1
    disp("velocity test passed, final velocity was " + vLand + ' m/s')
else
    disp("velocity test failed, final velocity was " + vLand + ' m/s')
end

check2 = FM(k) > 0;
if check2 == 1
    disp("fuel test passed, fuel remaining was " + FuelLeft + ' kg')
else
    disp("fuel test failed, fuel remaining was " + FuelLeft + ' kg')
end

check3 = A < 6*state.g;
if check3 == 1
    disp("acceleration test passed, max acceleration was " + maxAcc + ' m/s^2')
else
    disp("acceleration test failed, max acceleration was " + maxAcc + ' m/s^2')
end

end

