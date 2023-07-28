function [HIm] = HistogramEqualization(image) 
[rows ,cols ,layers]=size(image);
if layers > 1
    image=rgb2gray(image);
end
numofpixels=rows*cols;
HIm=uint8(zeros(rows,cols));
freq=zeros(256,1);
probc=zeros(256,1);
output=zeros(256,1);
%freq counts the occurrence of each pixel value.
%The probability of each occurrence is calculated by probf.
for i=1:size(image,1)
    for j=1:size(image,2)
        value=image(i,j);
        freq(value)=freq(value)+1;
    end
end
sum=0;
L=255;
%The cumulative distribution probability is calculated. 
for i=1:size(freq)
   sum=sum+freq(i);
   probc(i)=sum/numofpixels;
   output(i)=round(probc(i)*L);
end
for i=1:size(image,1)
    for j=1:size(image,2)
            HIm(i,j)=output(image(i,j));
    end
end
end
