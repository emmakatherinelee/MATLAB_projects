function coeffs = my_spline(y)

n = length(y(1,:));

%construct sparce array for space saving
coeffs = spalloc((n-1), 4, 4*(n-1));

%calculate b matrix (function of y) using augmented matrices
y_mod =[0 y 0];

y_out = y_mod(3:end) - y_mod(1:(end-2));
y_out(1) = y(2)-y(1);
y_out(end) = y(end) - y(end-1);
y_out = y_out';

%create A matrix
ud_diagonal = zeros((n-1),1) + 1;
A = diag(ud_diagonal,1)+diag(ud_diagonal,-1)+eye(n)*4;
A(1,1) = 2;
A(n,n) = 2;

%get D matrix which solves A*D = y'
A = sparse(A);
D = A\(3*y_out);

%construct coeff matrix using given equations
for i = 1:(length(y_out)-1)
coeffs(i,1) = y(i);
coeffs(i,2) = D(i);
coeffs(i,3) = 3*(y(i+1)-y(i)) - 2*D(i) - D(i+1);
coeffs(i,4) = 2*(y(i)-y(i+1)) + D(i) + D(i+1);
end

end

