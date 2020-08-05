%%
% plotExample : Example of plotting a time varying function
% 

figure;

N = 20;

y0 = [(1:(N/2)) ((N/2):-1:1)]' / N;

% Note that we keep the handle of this plot, h, so that we can modify the
% values later in the loop
h = plot (y0);

% Note the axis command which fixes the scale of the axes - refer to the
% Matlab help system for details on this
axis ([0 (N+1) -4 4]);

y2 = [zeros(N,1); y0];

dt = 0.1;   % timestep in seconds
T = 50.0;   % Total simulation time in seconds

w = 2.0;

for t=0:dt:T
    
    % Update the values for y
    y = 3*sin(w*t)*y0;
    
    % Update y using the set command and the handle h
    set (h, 'YData', y);
    
    % Pause command so we can see whats happening you can change the delay
    % here to whatever value you like in seconds. Try help pause for more
    % details
    pause(0.1);
end
