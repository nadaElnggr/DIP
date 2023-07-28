function imageList = GrayLevel8(image)
[rows,cols,layers] = size(image);
if layers > 1
    image=rgb2gray(image);
end
imageList = {};
k = 8;
while (k > 0)
 target_levels = 2^k;
 target_compr_factor = 256 / target_levels;
 reduced_image = uint8(floor(double(image)/256 * target_levels) * target_compr_factor);
 imageList{k}=reduced_image;
 k = k - 1;
end
end
