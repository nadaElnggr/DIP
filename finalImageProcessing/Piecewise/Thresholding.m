function [GMatrix] = Thresholding(image,c)
[rows ,cols ,layers]=size(image);
if layers > 1
    image=rgb2gray(image);
end
for row=1:1:rows
     for col=1:1:cols
        if(image(row,col)>c)
            GMatrix(row,col)=255;
        else
            GMatrix(row,col)=0;
        end
    end
end
end