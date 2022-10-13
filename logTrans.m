function [ Img ] = logTrans( Image , index, C )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

[H W L]=size(Image);

Img = zeros(H,W);

Image1 = im2double(Image);

if( index == 1 )
    for i = 1: L
       for j = 1: H
            for k = 1: W
                Img(j,k,i) = C*log(Image1(j,k,i)+1);                
            end
        end
    end
end

if( index == 2 )
    for i = 1: L
        for j = 1: H
            for k = 1: W
                Img(j,k,i) = exp(Image1(j,k,i)/C);                
            end
        end
    end    
end

Img  = im2uint8(Img);

end

