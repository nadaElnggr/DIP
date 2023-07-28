function [img_sum] = AddingTwoImages(img1,img2)
[rows ,cols]=size(img1);
img_sum = img1;

% Resizing both in the same size
img1=imresize(img1,[rows,cols]);
img2=imresize(img2, [rows cols]);

% Convert the images to double precision for numerical operations
img1 = im2double(img1);
img2 = im2double(img2);

% Add the two images together
img_sum = img1 +img2;

end