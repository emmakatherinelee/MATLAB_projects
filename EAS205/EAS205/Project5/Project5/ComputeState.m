%computes state of elastic string given mechanics-coefficients matrix,
%initial state, and time
function zt = ComputeState(A,t,z0)
zt = expm(A*t)*z0;
end