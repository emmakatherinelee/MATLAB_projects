%% Script1

%refresh
clear all
close all

%construct knots, then plot
n = 20;
y = rand(1,n);
x = 1:n;
scatter(x,y, 'or')
hold on

%get spline coeffs
coeffs = my_spline(y);

%plot interpolated spline with resolution of res
res = 20;
x_interp = 1:(1/res):n;

    %get interpolated value at each point
for i=1:length(x_interp)
y_interp(i) = eval_spline(coeffs, x_interp(i));
end

%plot and make pretty
plot(x_interp,y_interp, '-b')
xlim([min(x_interp) max(x_interp)])
