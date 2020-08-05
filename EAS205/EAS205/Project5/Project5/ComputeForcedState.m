%computes states for a given time of sin-cos forced string given...
%state-space matrix

function zt = ComputeForcedState(A,t,b,w)
[m,n] = size(A);
I = eye(m,n);
z0 = zeros(n,1);

%calculate appropraite coefficients for sin-cos terms
c2 = inv(w*I + 1/w*full(A)^2)*(-b);
c1 = (1/w)*A*c2;

%compute array of positions and velocities
zt = expm(A*t)*(z0-c2) + (sin(w*t)*c1 + cos(w*t)*c2);
end

