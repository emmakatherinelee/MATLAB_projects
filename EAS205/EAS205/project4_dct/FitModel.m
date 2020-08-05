%%for a set of data in 2-space, finds a best fit equation in the form
%%c1*sin(x) + c2*cos(x) + c3*log(x) + c4
%%uses least-square method
function [c1, c2, c3, c4] = FitModel(x,y)

for i = 1:length(x)
A(:,i) = [sin(x(i));
    cos(x(i));
    log(x(i));
    1];
end

pseudoInv = (A*A')^(-1)*A;
c = pseudoInv*y;
c1 = c(1);
c2 = c(2);
c3 = c(3);
c4 = c(4);
end