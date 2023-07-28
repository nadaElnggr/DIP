function[output_image]= IdealLowPass(input_image,D0)
% ILPF
% input_image = imread('grayImage.png');  
[M, N] = size(input_image);
FT_img = fft2(double(input_image));
%D0 = 15; 

% Designing filter
u = 0:(M-1);
idx = find(u>M/2);
u(idx) = u(idx)-M;
v = 0:(N-1);
idy = find(v>N/2);
v(idy) = v(idy)-N;

% MATLAB library function meshgrid(v, u) returns
% 2D grid which contains the coordinates of vectors
% v and u. Matrix V with each row is a copy 
% of v, and matrix U with each column is a copy of u
[V, U] = meshgrid(v, u);

% Calculating Euclidean Distance
D = sqrt(U.^2+V.^2);

% Comparing with the cut-off frequency and 
% determining the filtering mask
H = double(D <= D0);

% Convolution between the Fourier Transformed
% image and the mask
G = H.*FT_img;

% Getting the resultant image by Inverse Fourier Transform
% of the convoluted image using MATLAB library function 
% ifft2 (2D inverse fast fourier transform)  
output_image = real(ifft2(double(G)));

end