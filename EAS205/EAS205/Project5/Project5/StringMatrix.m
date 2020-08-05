%constructs state space matrix to simple elastic string mechanics, with top
%half as location, and bottom half for velocity
function A = StringMatrix(n,k,c,m)
nOnes = ones(n, 1) ;
T = sparse(-diag(2 * nOnes, 0) + diag(nOnes(1:n-1), -1) + diag(nOnes(1:n-1), 1));
A = [-c/m*eye(n) k/m*T;
    eye(n) zeros(n)];
end