function y = getPWLval(pwl,x)
% Evaluate a piecewise linear function, based on information stored in a
% structure. 

% Unbundle the variables needed
s1 = pwl.s1;  % The split point.  The point where both lines meet.
s2 = pwl.s2;
a = pwl.a;  % The line coefficients [a1 a2] such that y=a1*x + a2 when x <= s  
b = pwl.b;% The line coefficients [b1 b2] such that y=b1*x + b2 when when x > s
c = pwl.c;
% The size of x
n = length(x);

% A vector to hold the output
y = zeros(1,n);

%for each of the numbers in x
for k = 1:n
    
    if x(k) <= s1                   % Less than s, use a else use b
        y(k) = a(1)*x(k) + a(2);     % Use coefficients in a
    elseif x(k) <= s2 && x(k) > s1                      
        y(k) = b(1)*x(k) + b(2);     % Use coefficients in b
    else 
        y(k) = c(1)*x(k) + c(2);
    end                                
end