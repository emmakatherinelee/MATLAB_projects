function fv = Box3D ()
% Return a patch structure corresponding to a cube unit length on side centered at the origin

fv.vertices = 0.5 * [-1 -1 1; 1 -1 1;1 1 1; -1 1 1; -1 -1 -1; 1 -1 -1; 1 1 -1; -1 1 -1 ];
fv.faces = [1 2 3 4; 5 6 7 8; 2 6 7 3; 1 5 8 4];
 