function[log_I] = Log(image,c)
 if isempty(c)
        c = 1;
 end
[rows ,cols ,layers]=size(image);
if layers > 1
    image=rgb2gray(image);
end
L = 256;
log_I = uint8(c*(log(double(image)+1)) .* ((L - 1)/log(L)));
end