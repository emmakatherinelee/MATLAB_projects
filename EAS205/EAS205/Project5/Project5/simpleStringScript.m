%% simple system
close all;
hold off;

n = 51;
m = 1;
k = 5;
c = 0.01;

z0 = makez0(n);
A = StringMatrix(n,k,c,m);

time = 0:.1:100;

plot(z0(1:(length(z0)/2)));
for i = 1:length(time)
    zt = ComputeState(A,time(i), z0);
    nodes = [0 zt(1:(length(z0)/2))' 0];
    plot(0:(n+1), nodes);
    xlim([0 n+1]);
    ylim([-1.05 1.05]);
    
    pause(.001);
end
