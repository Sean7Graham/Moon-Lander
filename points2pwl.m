function pwl = points2pwl(x,y)
% points2pwl Find a Piecewise Linear Function through 3 points. Outputs the
% slopes and intercepts of the lines in form of a structure. 

% Example usage: lineCoeffs = points2pwl([1 2 3],[7 5 2])

% INPUTS x and y are vectors containing the coordinates of the 3 points
% x = [x1 x2 x3] and y = [y1 y2 y3]
% where points are (x1,y1), (x2,y2) and (x3,y3)

% OUTPUT is a structure:
% pwl.a is the coefficients in the first section
% pwl.b is the coefficients in the second section
% pwl.s is the split point where the two sections join

% Set the split between the two sections
s1 = x(2);
s2 = x(3);

% Find the slope and intercept of each section

% The coordinates of the two ends of the 1st section
xs = x([1 2]);   % equivalent to [x(1) x(2)]
ys = y([1 2]);


%Find the slope and the intercept of a line through the two points
[a1, a2] = points2line(xs,ys);


% The coordinates of the two ends of the 2nd section
xs = x([2 3]);
ys = y([2 3]);

%Find the slope and the intercept of a line through the two points
[b1, b2] = points2line(xs,ys);

xs = x([3 4]);
ys = y([3 4]);

[c1, c2] = points2line(xs,ys);

% Store in structure for easy output
pwl.s1 = s1;
pwl.s2 = s2;
pwl.a = [a1 a2];  % form: [slope inctercept]
pwl.b = [b1 b2];
pwl.c = [c1 c2];



function [m,c] = points2line(x,y)
% [m,c] = line2line(x,y) finds a straight line through two points
% x is a vector of the x coordinates 
% y is a vector of the y coordinates 
% m is the slope of the line
% c is the intercept of the line

% Form the matrix to solve
% mx1 + c = y1     
% mx2 + c = y2
A = [ x(1) 1 ; x(2) 1];
Y = [ y(1) ; y(2)];

%Solve the problem
C = A\Y;      %where C = [m ; c]

% The top element is the slope
m = C(1);

%The bottom element is the intercept
c = C(2);
    
