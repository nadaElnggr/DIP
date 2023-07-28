function [contrasted_out_img] = ContrastStretching(image,m,n) 
[rows ,cols ,layers]=size(image);
if layers > 1
    image=rgb2gray(image);
end
contrasted_out_img=image;

%setting values of ranges

s_min_range=m;
s_max_range=n;
entry_min=min(image(:));
entry_max=max(image(:));
s_range=s_max_range-s_min_range;
r_range=entry_max-entry_min;

%contrast streching equation =(fixed_range_ratio*(r-rmin)+smin
%fixed range_ratio=(smax-smin)/(rmax-rmin)
fixed_range_ratio=uint8(double(s_range)/double(r_range));

%applying contrast streching algorithim
for row_index=1:1:rows
    for col_index=1:1:cols
            contrasted_out_img(row_index,col_index) = (fixed_range_ratio*(image(row_index,col_index)-entry_min)+s_min_range);
        
    end
end

%displaying the new contrated output pic


end
