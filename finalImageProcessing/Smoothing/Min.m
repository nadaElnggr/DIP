function [filtered_img] = Min(image)
[rows ,cols ,layers]=size(image);
if layers > 1
    image=rgb2gray(image);
end
% Define the filter size
filter_size = 3;

% Pad the image with zeros
padded_img = padarray(image, [floor(filter_size/2) floor(filter_size/2)]);

% Initialize the filtered image
filtered_img = image;

% Apply the minimum filter to each pixel
for i = 1:size(image, 1)
    for j = 1:size(image, 2)
        window = padded_img(i:i+filter_size-1, j:j+filter_size-1);
        if (filtered_img(i, j) == 255)
        filtered_img(i, j) = min(window(:));
        end
    end
end
end