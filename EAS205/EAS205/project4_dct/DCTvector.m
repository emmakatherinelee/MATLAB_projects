%%calculates DCT vector orthonormal to all other DCT vector for an input
%%frequency index and space

function q = DCTvector(N,k)
 q_full = zeros(N,1);
 for i=1:N
    q_full(i,1) = cos((pi/(2*N))*(k-1)*(2*i-1));
 end
 q = q_full/norm(q_full); 
end

