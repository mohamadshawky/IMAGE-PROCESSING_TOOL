function [ newimage ] = Resize( image,index )
%RESIZE Summary of this function goes here
%   Detailed explanation goes here

image = imread(image);

if(index==1)
    newimage=imresize(image,1.2);
end
if(index==2)
    newimage=imresize(image,.95);
end

end

