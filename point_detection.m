clc;

%% Read Image
    %Reads the Image into an array for further processing
X = imread('peppers.png');
    %X = rgb2gray(X);
   
%% Point detection
Y = imread('peppers.png');
%Y1= bwareaopen(Y, 20);
% fplap = [1 1 1; 1 -8 1; 1 1 1]      %Laplacian at a point
fplap = [0 1 0; 1 -4 1; 0 1 0]      %Laplacian at a point
filtim = imfilter(Y,fplap,'symmetric', 'conv');

subplot(2,2,1)
imshow(Y);
title('Original');

subplot(2,2,2)
imshow(filtim);
title('Laplacian Point Filtered');

subplot(2,2,3)
imshow(Y-filtim);
title('Difference Image');

%% Gaussian Filtering of image
% fgauss = fspecial('gaussian',[25,25],4.0)
%         % 25X25 Gaussian filter with SD =25 is created.
% filtim = imfilter(X,fgauss,'symmetric', 'conv');
%         % Filter the image by convolution with the above designed filter.
%         % filtim now contains the gaussian filtered image.
%        
% subplot(2,2,1)
% imshow(X);
% title('Original');
%
% subplot(2,2,2)
% imshow(filtim);
% title('Gaussian Filtered');
%
% subplot(2,2,3)
% imshow(X-filtim);
% title('Difference Image');
%
% % flap1 = fspecial('laplacian', .2);
% % filtim1 = imfilter(filtim,flap1,'symmetric', 'conv');
%
% % fsobel = [-1 0 1; -2 0 2; -1 0 1]      %Grad in y
% fsobel = [-1 -2 -1; 0 0 0; 1 2 1]      %Grad in x
% % fsobel = [0 -1 -2; 1 0 -1; 2 1 0]        %45 degree
% filtim1 = imfilter(filtim,fsobel,'symmetric', 'conv');
%
% subplot(2,2,4)
% imshow(filtim1);
% title('LoG Image');

%% Spatial Filtering Smoothing <Weighted> &High Boost Filtering
%
% favg = [1/16 2/16 1/16; 2/16 4/16 2/16; 1/16 2/16 1/16]
% filtim = imfilter(X,favg,'symmetric', 'conv');
%
% subplot(2,2,1)
% imshow(X);
% title('Original');
%
% subplot(2,2,2)
% imshow(filtim);
% title('Weighted Filtering');
%
% subplot(2,2,3)
% imshow(X-filtim);
% title('Difference Image');
%
% subplot(2,2,4)
% imshow(X+0.2.*(X-filtim));
% title('High Boost Sharpened');