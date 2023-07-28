function [GMatrix] = Average_Weighted(image)
  OriginalImage = image;
  [rows,cols,matno]=size(OriginalImage);
  if matno==3
    OriginalImage=rgb2gray(OriginalImage);
  end
  GMatrix = OriginalImage;
  Masksize=(3-1)/2;
  w=(1/16)*[1 2 1;2 4 2;1 2 1]; 
  Ave=zeros(3);
  for i=Masksize+1:rows-Masksize
   for j=Masksize+1:cols-Masksize 
     Average = GMatrix(i-Masksize:i+Masksize,j-Masksize:j+Masksize);
     for x=1:3
         for y=1:3
             Ave(x,y)=Average(x,y)*w(x,y);
         end
     end
     Vector=Ave(:)';
     temp=uint8(sum(Vector));
     GMatrix(i,j)=temp;
   end 
  end
end