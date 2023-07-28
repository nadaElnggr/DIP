function[exp_I] = InverseLog(image,c)
 if isempty(c)
        c = 1;
  end
[rows ,cols ,layers]=size(image);
if layers > 1
    image=rgb2gray(image);
end
L = 256;
exp_I = uint8(c*(exp(double(image)) .^ (log(L) / (L-1))) - 1);
end