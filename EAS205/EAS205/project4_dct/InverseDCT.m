%%finds the inverse discrete cosine transformation vectors for a given set
%%of DCT; when applied to a vector of DCT values, this should return the
%%original input vector

function y = InverseDCT(x)
N = length(x);
Q = zeros(N,N);
y = zeros(N,1);
for k = 1:N
    Q(:,k) = DCTvector(N,k);
    y = y + x(k)*Q(:,k);
end
end
