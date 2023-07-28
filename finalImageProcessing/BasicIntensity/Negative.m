function[neg,img] = Negative(img)
[rows,cols,layers] = size(img);
if layers > 1
    img=rgb2gray(img);
end
L = 2 ^ 8;    
   
% finding the negative                   
 neg = (L - 1) - img;
end