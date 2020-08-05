%makes 1d array for for initial position and velocity for nodes on an
%elastic string
function z0 = makez0(n)
midpt = ceil(n/2);

y = [0:1:midpt, (midpt-1):-1:0];
y = y/max(y);
scatter(2:(n+1), y(2:(end-1)));

grid on;
ydot = zeros(n,1);
z0 = [y(2:(end-1))'
    ydot];
end