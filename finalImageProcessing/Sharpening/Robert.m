function [out] = Robert(originalImage)
[rows ,cols ,layers]=size(originalImage);
if layers > 1
    originalImage=rgb2gray(originalImage);
end
gray_image = double(originalImage);
[rows,cols]=size(gray_image);
ymask = [0 1; -1 0];
xmask = [1 0; 0 -1];
out = gray_image;
for i=2:rows-1
 for j=2:cols-1
     xtemp = xmask.*gray_image(i:i+1,j:j+1);
     xvalue = sum(xtemp(:));
     ytemp = ymask.*gray_image(i:i+1,j:j+1);
     yvalue = sum(ytemp(:));
     out(i, j) = sqrt(xvalue.^2 + yvalue.^2);
end
end
out = uint8(out);
end