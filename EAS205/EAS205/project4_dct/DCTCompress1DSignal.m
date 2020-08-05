%%takes in a 1D signal (like sound) and compresses to reduce
%%storage/simplify transmission
%%pct is value between 0 and 100, where 100 is complete resolution
%%maintained, and 0 is all resolution lost
function y_compressed = DCTCompress1DSignal(y,pct)

raw = DCT(y);

positiveRaw = abs(raw);

[sortedVal, sortedIndex] = sort(positiveRaw,'descend');
leng = length(sortedIndex);
des_index =  sortedIndex(1:(leng*pct/100));
compressed = zeros(leng,1);
compressed(sort(des_index)) = raw(sort(des_index));

y_compressed = InverseDCT(compressed);
end