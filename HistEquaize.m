function [ equimage ] = HistEquaize( image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%image = imread(image);

[H W D]=size(image);
hist=histo(image);
CDF=zeros(256,1);
NCDF=zeros(256,1);
equimage=zeros(H,W);

CDF(1) = hist(1);
for i=2:256
        CDF(i)= CDF(i-1)+hist(i);
end

M=min(CDF);
X=max(CDF);
L=256;

for k=1:256
    NCDF(k)=round(((CDF(k)-M) / (X-M) )*L);
end

for s=1:256
    for d=1:D
        for h=1:H
            for w=1:W
                if(image(h,w,d)==s)
                    equimage(h,w,d)=NCDF(s);  
                end
            end
        end
    end
end

equimage=uint8(equimage);
%figure,imshow(equimage);
end

