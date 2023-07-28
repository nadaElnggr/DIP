function [GMatrix] = Average_Simple(image,n)
  OriginalImage = image;
  [rows,cols,matno]=size(OriginalImage);
  if matno==3
    OriginalImage=rgb2gray(OriginalImage);
  end
  GMatrix = OriginalImage;
  Masksize=(n-1)/2;
  Division = n*n;
  for i=Masksize+1:rows-Masksize
   for j=Masksize+1:cols-Masksize 
     Average = GMatrix(i-Masksize:i+Masksize,j-Masksize:j+Masksize);
     Vector=Average(:)';
     temp=uint8(sum(Vector)/Division);
     GMatrix(i,j)=temp;
   end 
  end
end