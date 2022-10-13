function [ NewImage ] = NNLINEARWITHPADDING( image,index )
%NNLINEARWITHPADDING Summary of this function goes here
%   Detailed explanation goes here

[imH imW imD]=size(image);
mask=[0 1 0;1 1 1;0 1 0];
[maskH maskW]=size(mask);
maskHmid=floor(maskH/2);
maskWmid=floor(maskW/2);
H=imH+(maskHmid*2);
W=imW+(maskWmid*2);
unSortedVector=zeros(1,5);
sortedVector=zeros(1,5);

paddedimage=zeros(H,W);

newimage=zeros(imH,imW,imD);
image=im2double(image);

for d=1:imD
for i=1+maskHmid:H-maskHmid
    for j=1+maskWmid:W-maskWmid
        paddedimage(i,j,d)=image(i-maskHmid,j-maskWmid,d);
    end
end
end
paddedimage=im2double(paddedimage);
 x=0;
 y=0;
for l=1:imD
    for i=1:imH
        for j=1:imW
            f=1;
                 for s=1:maskH
                        for e=1:maskW
                            if(mask(s,e) == 1)
                                unSortedVector(1,f) = paddedimage(s+x,e+y,l);
                                f=f+1;
                            end                            
                        end
                 end
                 sortedVector=sort(unSortedVector);
                 newimage(i,j,l)=NonLinnerOP(sortedVector,index);
                 y=y+1;                                  
        end
        x=x+1;
        y=0;
    end
    x=0;
    y=0;
end

end

