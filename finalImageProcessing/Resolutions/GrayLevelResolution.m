function [output] = GrayLevelResolution(img,k)
[rows,cols,layers] = size(img);
if layers > 1
    img=rgb2gray(img);
end
target_levels = 2^k;
target_compr_factor = 256 / target_levels;
output = uint8(floor(double(img)/256 * target_levels) * target_compr_factor);
end