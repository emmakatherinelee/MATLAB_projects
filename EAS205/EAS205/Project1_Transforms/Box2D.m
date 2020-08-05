function fv = Box2D ()
% Return a patch structure corresponding to a square unit length on side centered at the origin

fv.vertices = 0.5 * [1 1; -1 1; -1 -1; 1 -1];
fv.faces = [1 2 3 4];
