function [ FI ] = FouierTransform( Image )
%FOUIERTRANSFORM Summary of this function goes here
%   Detailed explanation goes here
%I=imread(I);
Image = double(Image);
FI=fft2(Image);
FI=fftshift(FI);

%figure,imshow(NLAFI);
FI=uint8(FI);

end

