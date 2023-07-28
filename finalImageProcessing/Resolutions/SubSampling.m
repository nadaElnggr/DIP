function [Output] = SubSampling(image,c)
[rows, cols, matricesNo] = size(image);
SamplingFactor = c;
for metricesIndex=1:1:matricesNo
   Output(:,:,metricesIndex) = subSampling(image(:,:,metricesIndex),SamplingFactor);
end
function [outImage] = subSampling(image, subSamplingFactor)
[rows, cols] = size(image);
outImage = image(1:subSamplingFactor:rows,1:subSamplingFactor:cols);
end
end