%% Script 2
clear all
close all

%set up figure
axis([-10 10 -30 30]);
ylabel('angle')

ax = gca;

%get user input
[x y] = getpts(ax);

%get approximate spline coeffs from input
x_spl = my_spline(x');
y_spl = my_spline(y');

%construct parameter array

j = 1:.01:length(x);

%construct spline using interpolation on parameter array
for i=1:length(j)
x_interp(i) = eval_spline(x_spl, j(i));
y_interp(i) = eval_spline(y_spl,j(i));
end

%plot
hold on
scatter(x,y, 'ro')
plot(x_interp, y_interp, '-b')
