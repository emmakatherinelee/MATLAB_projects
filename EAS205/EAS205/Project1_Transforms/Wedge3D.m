function fv = Wedge3D ()
% Return a patch structure corresponding to a wedge with a square base in
% the xy plane.
fv.vertices = 0.5 * [1 1 0; -1 1 0; -1 -1 0; 1 -1 0; 0 1 1; 0 -1 1];
fv.faces = [1 2 3 4; 1 5 6 4; 2 5 6 3];
