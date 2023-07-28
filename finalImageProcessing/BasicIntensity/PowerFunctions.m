function [y] = PowerFunctions(image,input)
[rows,cols,layers] = size(image);
if layers > 1
    image=rgb2gray(image);
end
c=1; 
x1=double(image);      
y=c*(x1.^input);                           


% subplot(221),imshow(x), title('Aerial image')
% subplot(222),imshow((y),[]), title('Corrected image(power=3)')

end                        