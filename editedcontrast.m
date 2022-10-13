function [ Img ] = editedcontrast( Image )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 
[H W L]=size(Image);
 
Image = double(Image);
 
 
NewMin = 0;
NewMax = 255;
 
Img = zeros(H,W,L);
    
    for i = 1: L
        OldMin = min(min(Image(:, :, i)));
        OldMax = max(max(Image(:, :, i)));
        for j = 1: H
            for k = 1: W
                Img(j,k,i) = ( ( (Image(j,k,i) - OldMin) / (OldMax - OldMin) ) * ( NewMax - NewMin ) ) + NewMin;
            end
        end
    end
 
 
Img = uint8(Img);
 
figure,imshow(Img);
 
end
 






