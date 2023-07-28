function [counts] = Histogram(image)
[rows ,cols ,layers]=size(image);
if layers > 1
    image=rgb2gray(image); 
end
[rows,cols]=size(image);
counts=zeros(1,256);
for i=1:rows
 for j=1:cols
    grayLevel=image(i,j);
    counts(grayLevel+1)=counts(grayLevel+1)+1;
end
end
end