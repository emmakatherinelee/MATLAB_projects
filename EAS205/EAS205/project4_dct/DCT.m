%%finds representative DCT vector for given input vector
function x = DCT(y)
N = length(y);
Q = zeros(N,N);
x = zeros(N,1);
for k = 1:N
    Q(:,k) = DCTvector(N,k);
    x(k) = dot(Q(:,k),y);
end
end

