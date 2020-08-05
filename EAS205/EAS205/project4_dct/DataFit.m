%%

x = 4*pi*rand(200, 1);

c = [2 -1 2 4]

y = [sin(x) cos(x) log(x) ones(size(x))] * c';

y = y + 1*(rand(size(y)) - 0.5);

figure;

plot (x, y, 'bo');