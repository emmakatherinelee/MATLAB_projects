%
% RobotScript
%

%%% Your job is to complete the script by replacing the sections
%%% marked with ???

%% Create the axes
grid on
axis square
axis ([-10 10 -10 10]);
set(gcf, 'Color', 'w')

head = [2 2];
neck = [1 1];
shoulder_girdle = [4 2];
arm = [3 1];

%% Animation loop
for i = 0:200
    
    x = sind(3*i);
    
    %% Joint angles
    left_elbow_angle     = 45*x;
    left_shoulder_angle  = 45*x;
    
    right_elbow_angle    = -45*x;
    right_shoulder_angle = -45*x;
    
    %% Compute Relevant Coordinate Transforms to the base frame of reference
    
    % Transform coordinates from frame 2 to frame 1
    g12 = Translation2D(0,(1/2)*(shoulder_girdle(2) + neck(2)));
    
    % Transform coordinates from frame 3 to frame 1
    g13 = Translation2D(0, (1/2)*(head(2)+neck(2))); %
    
    % Transform coordinates from frame 4 to frame 1
    g14 = Translation2D((1/2)*arm(1),0)*Rotation2D(left_shoulder_angle)*Translation2D((1/2)*shoulder_girdle(1),0);
    
    % Transform coordinates from frame 5 to frame 4
    g45 = Translation2D((1/2)*arm(1),0)*Rotation2D(left_elbow_angle)*Translation2D((1/2)*arm(1),0);
    
    % Transform coordinates from frame 5 to frame 1
    g15 = g14*g45;
    
    % Transform coordinates from frame 6 to frame 1
    g16 = Translation2D(-(1/2)*arm(1),0)*Rotation2D(-right_shoulder_angle)*Translation2D(-(1/2)*shoulder_girdle(1),0);
    
    % Transform coordinates from frame 7 to frame 6
    g67 =  Translation2D(-(1/2)*arm(1),0)*Rotation2D(-right_elbow_angle)*Translation2D(-(1/2)*arm(1),0);
    
    % Transform coordinates from frame 7 to frame 1
    g17 = g16*g67;
    
    %% Scaling Transforms
    % Compute scaling transformations required to map the vertices of the unit
    % square returned by Box2D to the appropriate size box.
    
    % Scaling for Box 1
    g1W = Scale2D (4, 2);
    
    % Scaling for Box 2
    g2W = Scale2D(1, 1);
    
    % Scaling for Box 3
    g3W = 2*Scale2D(1, 1);
    
    % Scaling for Box 4
    g4W = Scale2D(3, 1);
    
    % Scaling for Box 5
    g5W = g4W;
    
    % Scaling for Box 6
    g6W = g4W;
    
    % Scaling for Box 7
    g7W = g4W;
    
    %% Draw the transformed boxes including the appropriate scale factors
    
    % Clear the drawing
    cla;
    
    DrawWireframe(ApplyTransform(    g1W, Box2D()));      % Draw box centered at frame 1
    DrawWireframe(ApplyTransform(g12*g2W, Box2D()));           % Draw box centered at frame 2
    DrawWireframe(ApplyTransform(g13*g3W, Box2D()));           % Draw box centered at frame 3
    DrawWireframe(ApplyTransform(g14*g4W, Box2D()));           % Draw box centered at frame 4
    DrawWireframe(ApplyTransform(g15*g5W, Box2D()));           % Draw box centered at frame 5
    DrawWireframe(ApplyTransform(g16*g6W, Box2D()));           % Draw box centered at frame 6
    DrawWireframe(ApplyTransform(g17*g7W, Box2D()));           % Draw box centered at frame 7
    
    % These lines are here to smooth the animation
    pause (0.1);
    drawnow;
end

function g = Scale2D(sx,sy)
g = [sx 0 0;
    0 sy 0;
    0 0 1]
end

function g = Rotation2D(theta)
g = [cosd(theta) -sind(theta) 0;
    sind(theta) cosd(theta) 0;
    0 0 1];
end

function g = Translation2D(tx, ty)
g = [1 0 tx;
    0 1 ty;
    0 0 1];
end
