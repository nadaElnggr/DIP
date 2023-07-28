function imagelist = BitPlaneSlicing(image)
  [rows ,cols ,layers]=size(image);
  if layers > 1
    image=rgb2gray(image);
  end
  imagelist={};
  newImage = zeros(rows,cols,8);
  for k=1:8
    for row_index=1:1:rows
        for col_index=1:1:cols
            newImage(row_index,col_index,k)=bitget(image(row_index,col_index),k);
        end
    end
   end
  for i = 1:8
    myChannel = newImage(:,:,i);
    imagelist{i}=myChannel;
  end
end

