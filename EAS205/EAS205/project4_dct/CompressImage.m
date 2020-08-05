%%compresses an image to have lower resolution and less required storage

function out = CompressImage(I,n)
width = length(I(1,:));
height = length(I(:,1));

widthBlocks = floor(width/8);
heightBlocks = floor(height/8);
Inew = I(1:(8*heightBlocks), 1:(8*widthBlocks));

out = zeros(8*heightBlocks, 8*widthBlocks);
for i=1:(heightBlocks-1)
    for j = 1:(widthBlocks-1)

        block = Inew((8*i):(8*i)+7, (8*j):(8*j)+7);
        b = CompressBlock(block, n);
        out((8*i):(8*i)+7, (8*j):(8*j)+7) = b;
    end
end
end

