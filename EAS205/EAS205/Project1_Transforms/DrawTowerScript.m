%
% DrawTowerScript
%

%%% Your job is to complete the script by replacing the sections
%%% marked with ???

%% Create the axes
axis ([-1 1 -1 1]);
% Configure in camera mode where the x coordinate increases from left to right
% and the y coordinated increases as you go from top to bottom
axis ij;

box1 = [8, 6, 4];
box2 = [4, 3, 2];
%% Animation loop
for i = 0:150
    
    %% Setup viewing transformation
    pitch = 34;
    yaw = 2*i;
    tz = 12;
    
    % Model transformation from world frame to camera frame
    % Rotate about x axis by 90 degrees - transformation from a world
    %     coordinate frame where the z axis points upward
    % Rotate about the x axis - pitch
    % Rotate about the y axis - yaw
    % Translate along the optical axis z
    gCW = Translation3D(0, 0, tz) *  Rotation3D ('x', pitch) * Rotation3D ('y', yaw) * Rotation3D ('x', 90);
    
    
    %% Drawing code
    
    % Clear the figure
    cla;
    
    % Compute correct scaling and transformation to map unit cube to base box
    % in the WORLD frame
    gW1 = Scale3D(box1(1), box1(2), box1(3));
    
    % Transform first block to the CAMERA frame by applying correct transform to unit cube
    Block1C = ApplyTransform(gCW*gW1, Box3D());
    
    % Apply perspective projection and draw first block
    DrawWireframe (PerspectiveProjection(Block1C));
    
    
    % Compute correct scaling and transformation to map unit cube to second box
    % in the WORLD frame
    gW2 = Scale3D(box2(1), box2(2), box2(3));
    
    % Transform second block to the CAMERA frame by applying correct transform to unit cube
    Block2C = ApplyTransform(Translation3D(0, -.5*box1(3)-.5*box2(3), 0)*gCW*gW2, Box3D());
    
    % Apply perspective projection and draw second block
    DrawWireframe (PerspectiveProjection(Block2C));
    
   
    % Compute correct scaling and transformation to map unit wedge to third block
    % in the WORLD frame
    scale = 1.047;
    gW3 = Scale3D(scale*box2(1), scale*box2(2), scale*box2(3));
    
    % Transform third block to the CAMERA frame by applying correct transform to unit cube
    Block3C = ApplyTransform(Translation3D(0, -.5*(box1(3)+box2(3)+box2(3)), 0)*gCW*gW3, Wedge3D());
    
    % Apply perspective projection and draw third block
     DrawWireframe (PerspectiveProjection(Block3C));
%     
%     % These lines are here to smooth the animation
    pause (0.1);
    drawnow;
end

function g = Scale3D(sx, sy, sz)
g = [sx 0 0 0;
    0 sy 0 0;
    0 0 sz 0;
    0 0 0 1];
end

function g = Rotation3D(axis, angle)
switch axis 
    case 'x'
        g = [1 0 0 0;
            0 cosd(angle) -sind(angle) 0;
            0 sind(angle) cosd(angle) 0;
            0 0 0 1];
    case 'y'
       g = [cosd(angle) 0 sind(angle) 0;
            0 1 0 0;
            -sind(angle) 0 cosd(angle) 0;
            0 0 0 1];
    case 'z'
        g = [cosd(angle) -sind(angle) 0 0;
            sind(angle) cosd(angle) 0 0;
            0 0 1 0;
            0 0 0 1];
    otherwise
        g = [1 0 0 0;
            0 1 0 0;
            0 0 1 0;
            0 0 0 1];
end
end

function g = Translation3D(tx, ty, tz)
g = [1 0 0 tx;
    0 1 0 ty;
    0 0 1 tz;
    0 0 0 1];
end

function out = PerspectiveProjection(fv)
P = fv.vertices;
P2(:,1) = P(:,1)./P(:,3);
P2(:,2) = P(:,2)./P(:,3);
out = fv;
out.vertices = P2;
end