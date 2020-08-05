 %constructs 'net' (2nxn) mat rix equivalent to no initial velocity and a
%peak p at (m,m)

function z0sheet  = makez0sheet(m,n,p) 
z0sheet = zeros(2*n,n);
z0sheet(m,m) = p;
z0sheet(m-1,m) = .5*p;
z0sheet(m+1,m) = .5*p;
z0sheet(m,m-1) = .5*p;
z0sheet(m,m+1) = .5*p;

z0sheet(m-1,m-1) = .5*p;
z0sheet(m+1,m+1) = .5*p;
z0sheet(m+1,m-1) = .5*p;
z0sheet(m-1,m+1) = .5*p;
end