function [ Img ] = contrastStreching( Image, OldMin, OldMax, NewMin, NewMax )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Image = imread(Image);

[H W L]=size(Image);

Img = zeros(H,W);

    Image = double(Image);
    for i = 1: L
        for j = 1: H
            for k = 1: W
                Img(j,k,i) = ( ( (Image(j,k,i) - OldMin) / (OldMax - OldMin) ) * ( NewMax - NewMin ) ) + NewMin;
            end
        end
    end


Img = uint8(Img);

%figure,imshow(Img);

end

