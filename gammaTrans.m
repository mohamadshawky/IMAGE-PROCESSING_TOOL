function [ Img ] = gammaTrans( Image, gamma_value )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[H W L]=size(Image);

Img = zeros(H,W);

Image = double(Image);

    for i = 1: L
        for j = 1: H
            for k = 1: W
                Img(j,k,i) = (Image(j,k,i)/255)^(gamma_value);
                Img(j,k,i) = Img(j,k,i)*255;
            end
        end
    end

Img = uint8(Img);

%figure,imshow(Img);

end

