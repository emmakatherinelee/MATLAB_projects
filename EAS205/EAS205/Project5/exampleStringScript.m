%% example script
%%

%% Sheet System
close all;
hold off;

p = 3
n = 31;
m = 1;
k = 5;
c = 0.01;
az = -25;
el = 75;

z0sheet = makez0sheet(round(n/2),n,p);
z  = z0sheet((1:n),:);
z = single(z(:));
zdot = z0sheet(((n+1):end), :);
zdot = single(zdot(:));
z0 = [z; zdot];

A = SheetMatrix(n,k,c,m);

time = 0:.05:10;
ax = gca;
set(ax,'ZLim',[-1.2 1.2],'CLim', [-.5 .5], 'view', [az el], 'Color', 'k', 'visible', 'off', 'Position', [.07 .07 .9 .9]);
set(gcf,'Color', 'k');
for i = 1:length(time)
    
    zt = ComputeState(A,time(i), z0);
    
    nodes = zeros((n+2),(n+2));
    nodes(2:(end-1), 2:(end-1)) = reshape(zt(1:(length(z0)/2)),n,n);
    cla;
    s = surface(ax, nodes, 'EdgeColor', 'none', 'FaceColor', 'interp', 'FaceLighting','gouraud','FaceColor','interp',...
      'AmbientStrength',0.75);
  light('Position',[-3 -3 0],'Style','local')
    drawnow;
set(ax,'ZLim',[-p p],'CLim', [-p p], 'view', [az el], 'Color', 'k', 'visible', 'off');
end