function [GMatrix] = Median(image,n)
  OriginalImage =image;
  [rows,cols,matno]=size(OriginalImage);
  if matno==3
    OriginalImage=rgb2gray(OriginalImage);
  end
  GMatrix = OriginalImage;
  Masksize=(n-1)/2;
  med =ceil((n*n)/2);
  for i=Masksize+1:rows-Masksize
   for j=Masksize+1:cols-Masksize 
           median = OriginalImage(i-Masksize:i+Masksize,j-Masksize:j+Masksize);
           Vector=median(:)';
           median = sort(Vector);
           GMatrix(i,j)= median(med);
   end 
  end
end