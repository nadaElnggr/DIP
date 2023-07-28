function [GMatrix] = GrayLevelSlicing2(image,m,n)
[rows ,cols ,layers]=size(image);
if layers > 1
    image=rgb2gray(image);
end
for row_index=1:1:rows
    for col_index=1:1:cols
        if(image(row_index,col_index)>=m && image(row_index,col_index)<=n)
            GMatrix(row_index,col_index) = 255;
        else
            GMatrix(row_index,col_index) = image(row_index,col_index);
        end
    end
end
end
