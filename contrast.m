function new_img = contrast(imge,range)
img=imread(imge);
[w,h]=size(img);
img=double(img);
min1=min(min(img));
max1=max(max(img));
g=zeros(w,h);
x=(range^2)-1;
if x>255
    new_max=255;
else
    new_max= x;
end
new_min=0;
for i=1:w
    for j=1:h
        x=img(i,j);
        g(i,j)=((x-min1)./(max1-min1)*(new_max-new_min)+new_min);
    end
end
% subplot(2,2,1)
new_img=uint8(g);
imshow(new_img)
% subplot(2,2,2)
% k=imread('house.jpg');
% k=rgb2gray(k);
% imshow(k);
