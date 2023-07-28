function [outImg] = ANDMask (img2)
% Read the mask image
img1 = imread('and.png');
% img2 = imread('Hydrocephalus-with-increased-head-circumference-in-a-3-month-old-child.jpg');

% Verify that the two images have the same dimensions
if ~isequal(size(img1), size(img2))
     [cols,rows] = size(img1);
     img2 = imresize(img2, [rows cols]); 
end

% Initialize the output image
outImg = zeros(size(img1), 'uint8');

% Apply the AND mask between the two images
for i = 1:size(img1, 1)
    for j = 1:size(img1, 2)
        for k = 1:size(img1, 3)
            if img1(i, j, k) > 70 %after printing values of matrix we see that it is the threshold
                outImg(i, j, k) = img2(i, j, k);
            else
                outImg(i, j, k) = 0;
            end
        end
    end
end