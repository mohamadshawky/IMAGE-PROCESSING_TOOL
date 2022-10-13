function [img]= correlation(image)
img = imread(image);
filter = 1/49 *[1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1; 1 1 1 1 1 1 1 ; 1 1 1 1 1 1 1; 1 1 1 1 1 1 1];     
img2 = imfilter(img,filter);
imshow(img2);
