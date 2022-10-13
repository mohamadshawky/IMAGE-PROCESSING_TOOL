function new_img =test(img,filter_size)
img=imread(img);
% img=rgb2gray(img);
[i,j]=size(img);
len = (filter_size-1)/2;
%Replicate Padding
temp=padarray(img,[len len],'circular','both');
w=i+len;
h=j+len;
new_img = zeros(w-len,h-len);
x=(filter_size)^2;
  for h=1+len:h
    for w=1+len:w
        new_img(w-len,h-len)=floor(sum(sum(temp(w-len:w+len,h-len:h+len)))/x);
    end
  end
new_image=uint8(new_img);
imshow(new_image)

% A = [1 2; 3 4];
% B = padarray(A,[2 2],'circular','both')
% k = padarray(A,[2 2],'replicate','both')


