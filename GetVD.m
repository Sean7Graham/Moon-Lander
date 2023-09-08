function[vdesired] = GetVD(state)
%GetVD
%function which determines the desired velocity at
%given time

vdesired = state.slope*state.h + state.intercept;

end
