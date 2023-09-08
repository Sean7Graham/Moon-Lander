function y = PWLvalues(pwl,x)
%PWLvalues
%evaluates a 3-part linear function based on coordinates stored in the
%input structure

n = length(x); % size of x
y = zeros(1,n); %initialise the output vector

s1 = pwl.s1;  % Split point 1
s2 = pwl.s2; % Split point 2
a = pwl.a; % The line coefficients [a1 a2] such that y=a1*x + a2 when x <= s1  
b = pwl.b; % The line coefficients [b1 b2] such that y=b1*x + b2 when when x <= s2 & x > s1
c = pwl.c; % The line coefficients [c1 c2] such that y=c1*x + c2 when when x > s2


%for loop to choose the appropriate line depending on the value of x
for k = 1:n
    if x(k) <= s1                  
        y(k) = a(1)*x(k) + a(2);     
    elseif x(k) <= s2 && x(k) > s1                      
        y(k) = b(1)*x(k) + b(2);     
    else 
        y(k) = c(1)*x(k) + c(2);
    end                                
end