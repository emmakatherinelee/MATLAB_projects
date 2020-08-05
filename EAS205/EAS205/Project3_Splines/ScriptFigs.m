%
% Script for generating figures and testing stuff.
%

n = 10;

x = 1:n;
y = randn(n,1);

pp = spline (x, y);


%% Plot the results

delta = 0.05;
x2 = 1:delta:n;

figure;
plot (x2, ppval(pp, x2));
hold on;
plot (x, y, 'ro');
hold off;

%% 2D Spline

% create an axis

figure;
axis([-10 10 -10 10]);

[X, Y] = getpts();

N = length(X);



ppx = spline (1:N, X);
ppy = spline (1:N, Y);

delta = 0.01;

X2 = ppval (1:delta:N, ppx);
Y2 = ppval (1:delta:N, ppy);

hold on;
plot (X2, Y2);
plot (X, Y, 'ro');
