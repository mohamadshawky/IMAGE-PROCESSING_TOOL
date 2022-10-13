function [ newimage ] = Weight( image)
image = imread(image);
mask = [1/16 1/8 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];
newimage=PadingAvarageFilter(image,mask);
end

