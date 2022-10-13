function [ newimage ] = IgnorAvarageFilter( image,mask )
%IGNORAVARAGEFILTER Summary of this function goes here
%   Detailed explanation goes here
[H W L]=size(image);
[HF WF]=size(mask);
newimage=zeros(H,W);
midX=round(HF/2);
midY=round(WF/2);
image=im2double(image);

for l=1:L
for i=1:H
    for j=1:W
        if(i<midX)
            newimage(i,j,l)=image(i,j,l);
            
        else
            if(j>=midY && j<=W-(midY-1)&& i<=H-(midX-1))
                x=i-(midX-1);
                y=j-(midY-1);
                for s=1:HF
                    for e=1:WF
                        newimage(i,j,l)=newimage(i,j,l)+(image(x,y,l)* mask(s,e));
                        y=y+1;
                    end
                    y=j-(midY-1);
                    x=x+1;
                end                            
            else
                newimage(i,j,l)=image(i,j,l);
            end
        end
    end
    
end
end

newimage = im2uint8(newimage);

end





