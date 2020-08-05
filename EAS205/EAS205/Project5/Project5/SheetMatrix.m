%construct state space coefficent matrix for 2D array of points ('net') for
%elastic spring mechanics in 2d

function A = SheetMatrix(r,k,c,m)
n = r*r;
nOnes = ones(n, 1) ;
T = sparse(-diag(4 * nOnes, 0) + diag(nOnes(1:n-1), -1) + diag(nOnes(1:n-1), 1)  + diag(nOnes(1:n-r), -r) + diag(nOnes(1:n-r), r));
for N = 1:(r-1)
   T((N*r), (r*N+1)) = 0;
   T((N*r+1), (r*N)) = 0;
end
A = [-c/m*eye(n) k/m*T;
    eye(n) zeros(n)];
end
