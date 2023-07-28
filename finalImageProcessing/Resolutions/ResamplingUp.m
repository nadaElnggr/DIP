function [out_img] = ResamplingUp(image,k)
% Set the size of the output image 
[nrows, ncols, nchannels] = size(image); 
factor_size=k;
out_img = uint8(zeros(factor_size * nrows, factor_size * ncols, nchannels)); 

% For each channel, sample the input image 
for ch_idx = 1:nchannels 
    for row_idx = 1:factor_size*nrows
        for col_idx = 1:factor_size*ncols
            % Find the nearest neighbor 
            row_inp = round(row_idx/factor_size); 
            col_inp = round(col_idx/factor_size); 
            out_img(row_idx, col_idx, ch_idx) = image(row_inp, col_inp, ch_idx); 
        end 
    end 
end 
figure;
subplot(3,2,[1 2])
imshow(out_img);
subplot(3,2,[3 4 5 6]);
imshow(image);
end
