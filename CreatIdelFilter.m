function [ Filter ] = CreatIdelFilter( D0,H,W )
%CREATIDELFILTER Summary of this function goes here
%   Detailed explanation goes here
Filter=zeros(H,W);
centerX=round(W/2);
centerY=round(H/2);
D=0;
for i=1:H
    for j=1:W
        D=sqrt(power((i-centerY),2)+power((j-centerX),2));
        if(D<=D0)
            Filter(i,j)=1;
        end
    end
end
%figure,imshow(Filter);
end

