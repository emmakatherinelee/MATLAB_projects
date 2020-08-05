%%takes in 8x8 block and somewhat preserves color differentation
function B = CompressBlock(A, n)
y = single(A(:));
raw = DCT(y);

positiveRaw = abs(raw);

[sortedVal, sortedIndex] = sort(positiveRaw,'descend');
leng = length(sortedIndex);
des_index =  sortedIndex(1:n);
compressed = zeros(leng,1);
compressed(sort(des_index)) = raw(sort(des_index));

y_compressed = InverseDCT(compressed);
B = reshape(y_compressed,8,8);
end

