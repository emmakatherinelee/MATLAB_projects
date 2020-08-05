%% Forced System

%simulate string dynamics for a string with one end forced at a sin-cos
%pattern

%expected and confirmed behavior: for resonance freuqnce, the string's
%motion tends towards infinite. That is it is a standing wave with (n+1)-many
%stationary nodes, with the amplitude increasing over time. That is, the
%first frequency has nodes on the ends, the second has nodes on the end and
%1 in the middle, and so on.

%for non-resonance frequencies, the natural vibration of the system and the
%forced oscillation are out of phase, causing periodic total interference
%and total amplification

close all;
hold off;

n = 21;
m = 1;
k = 5;
c = 0.01;

b = zeros((2*n),1);
b(1) = 1;

z0 = makez0(n);
A = StringMatrix(n,k,c,m);
res = ComputeResonantFrequencies(A);
w = res(2);

time = 0:.1:200;

plot(z0(1:(length(z0)/2)));
for i = 1:length(time)
    zt = ComputeForcedState(A,time(i), b,w);
    nodes = [0 zt(1:(length(z0)/2))' 0];
    plot(0:(n+1), nodes);
    xlim([0 n+1]);
    ylim([-1.05 1.05]);
    
    pause(.001);
end