%
% Backhoe3D
% Model a backhoe in 3D
%

%% Set up the figure

figure;
axis vis3d;
axis ([-10 10 -10 10 -3 10]);

%% Draw the backhoe

% Set the Joint Angles
theta1 = 84;
theta2 = 59;
theta3 = 236;


% Transform between frames A and B - Translation along y by 1.5
gBA = Translation3D(0, 1.5, 0);

% Transform between frames B and C - Rotation by -theta1
gCB = Rotation3D ('x', -theta1);

% Transform between frames D and C - Translation along y by 1.5
gDC = Translation3D(0, 1.5, 0);

% Transform between frames E and D - Translation along y by 1.5
gED = Translation3D(0, 1.5, 0);

% Transform between frames F and E - Rotation by theta2
gFE = Rotation3D ('x', theta2);

% Transform between frames G and F - Translation along y by 2
gGF = Translation3D(0, 2, 0);

% Transform from frame G to H - Rotation about z by theta3
gHG = Rotation3D ('z', theta3);


% Transformation from frame D to frame H
gHD = gHG*gGF*gFE*gED;

% Transformation from frame A to frame G
gHA = gHD*gDC*gCB*gBA;


% Scale factor for boxes A, D and G

gGW = Scale3D (3, 4, 3);
gDW = Scale3D (1, 3, 1);
gAW = Scale3D (1, 3, 1);

% Draw the transformed boxes including the appropriate scale factors

cla;

DrawWireframe(ApplyTransform(gHG*gGW, Box3D()));      % Draw box centered at frame G
DrawWireframe(ApplyTransform(gHD*gDW, Box3D()));      % Draw box centered at frame D
DrawWireframe(ApplyTransform(gHA*gAW, Box3D()));      % Draw box centered at frame A
