function [ histImage ] = histo( Image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Image=imread('cameraman.tif');
[H W L] = size(Image);
histImage= zeros(256,1);

if(L==3)
    for k=1:1
        for i=1:H
            for j=1:W
                histImage(Image(i,j,1)+1) = histImage(Image(i,j,1)+1)+ 1;
                histImage(Image(i,j,2)+1) = histImage(Image(i,j,2)+1)+ 1;
                histImage(Image(i,j,3)+1) = histImage(Image(i,j,3)+1)+ 1;
            end
        end
    end
end

if(L==1)
    for k=1:1
        for i=1:H
            for j=1:W
                histImage(Image(i,j)+1) = histImage(Image(i,j)+1)+ 1;
            end
        end
    end
end
histImage=histogram(Image);
end

