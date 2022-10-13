close all;
img = rgb2gray(imread ('peppers.png'));

%A=[0 -1 0 ; -1 8 -1 ; 0 -1 0];

A=[-1 -1 -1 ; 2 2 2 ; -1 -1 -1];

subplot(1,3,1);

imshow(img);

result1 = imfilter (img,A);subplot(1,3,2)

imshow(result1);

title('line detection mask-horizontal');

A=[-1 2 -1;-1 2 -1;-1 2 -1];

result1 = imfilter (img,A);

subplot(1,3,3)

imshow(result1);

title('line detection mask-verticle');