%
% Examples of Linear Systems
%

%% Example 1 - 1D interpolation:
% Given the value of a function y = a x^3 + b x^2 + c x + d at a few points
% recover the coefficients z, b, c and d and hence the value of the
% function everyhere

x1 = 0.10;  y1 = -3.3;

x2 = 0.20;  y2 = 10.0;

x3 = 0.55;  y3 = -1.0;
 
x4 = 0.75;  y4 = 2.2;

figure;
plot ([x1 x2 x3 x4], [y1 y2 y3 y4], 'r*');

% Set up the linear system - one equation for every correspondence
A = [x1^3 x1^2 x1 1; ...
     x2^3 x2^2 x2 1; ...
     x3^3 x3^2 x3 1; ...
     x4^3 x4^2 x4 1; ...
    ];

b = [y1 y2 y3 y4]';

% Solve for the coefficients
coeffs = A \ b

% Plot the function
hold on;

x = 0:0.01:1;

y = coeffs(1)*x.^3 + coeffs(2)*x.^2 + coeffs(3)*x + coeffs(4);

plot (x, y);


%% Example 2 - 2D interpolation:
% Given the value of a function of 2 variables 
% z = f(x,y) = a x^2 + b xy + cy^2 + dx + ey + f
% recover all of the coefficients and hence the value everywhere

x1 =  1.0; y1 =  1.0; z1 =  0.5;
x2 =  2.0; y2 = -1.0; z2 = -2.0;
x3 =  3.0; y3 =  5.0; z3 = -14.4282;
x4 = -1.0; y4 =  1.0; z4 = 4.5;
x5 = -2.0; y5 =  1.5; z5 = 11.3391;
x6 =  0.0; y6 =  3.0; z6 = 6.9282;

% Set up the linear system
A = [
    x1^2 x1*y1 y1^2 x1 y1 1; ...
    x2^2 x2*y2 y2^2 x2 y2 1; ...
    x3^2 x3*y3 y3^2 x3 y3 1; ...
    x4^2 x4*y4 y4^2 x4 y4 1; ...
    x5^2 x5*y5 y5^2 x5 y5 1; ...
    x6^2 x6*y6 y6^2 x6 y6 1; ...
    ];

b = [z1 z2 z3 z4 z5 z6]';


% Solve for the coefficients
coeffs = A \ b;

% plot the function

[X, Y] = meshgrid([-5:0.1:5], [-5:0.1:5]);

Z = coeffs(1).*X.^2 + coeffs(2).*X.*Y + coeffs(3).*Y.^2 + coeffs(4)*X + coeffs(5)*Y + coeffs(6);

figure;
surf (X, Y, Z);
hold on;

plot3 ([x1 x2 x3 x4 x5 x6], [y1 y2 y3 y4 y5 y6], [z1 z2 z3 z4 z5 z6], 'r*');

%% Stretchy rope example

N = 50;

m = 0.1;
M = 2.5;
g = 9.8;
k = 5.0;

% Index of the node with the weight
idx = 30;

A = zeros(N);
b = zeros(N,1);

% Set up the linear system.

for i = 2:(N-1)
    A(i,i-1) = k;
    A(i,i)   = -2*k;
    A(i,i+1) = k;
    
    b(i) = m * g;
end

% Fixed end points
A(1,1) = 1;
b(1) = 0;

A(N,N) = 1;
b(N) = 0;

% Special equation for the node with the weight

b(idx) = (m + M) * g;

% Solve for the displacement
y = A \ b;

% Plot 
figure;
plot (1:N, y, 'r.', 'MarkerSize', 5);
hold on;
plot (1:N, y, 'b');
hold off;


%% Look at the structure of the stretchy rope system (tridiagonal)

figure;
spy(A);

% Allocate a sparse matrix, N x N
A2 = spalloc(N,N, 3*N);

% Set up the linear system.

for i = 2:(N-1)
    A2(i,i-1) = k;
    A2(i,i)   = -2*k;
    A2(i,i+1) = k;
end

% Fixed end points
A2(1,1) = 1;
A2(N,N) = 1;

figure;
spy(A2);

nnz(A2);

% Matlab will recognize that A2 is sparse and tridiagonal and invoke an
% efficient algorithm for this case. You don't have to do anything special.
y2 = A2 \ b;


%% Poisson Equation example

% Define an N x N grid
N = 50;

A = eye(N*N, N*N);

b = zeros(N, N);

% Fill in equations for the central elements according to the Poisson
% equation

for i = 2:N-1
    for j = 2:N-1
        idx = sub2ind([N N], i, j);
        A(idx, idx) = -4;
        A(idx, idx+1) = 1;
        A(idx, idx-1) = 1;
        A(idx, idx-N) = 1;
        A(idx, idx+N) = 1;
    end
end

% Boundary conditions
% Set the temperature along side1

b(:,1) = 1:N;
b(1,:) = 1:N;
b(N,:) = N:-1:1;

% Solve the PDE with boundary conditions
temp = A \ b(:);

% Plot the answer
figure;
mesh(reshape(temp, N, N));


%% Look at the structure of the Poisson system

spy(A);

A2 = sparse(A);

whos A A2;

tic;
temp2 = A2 \ b(:);
toc;

tic;
temp = A \ b(:);
toc;