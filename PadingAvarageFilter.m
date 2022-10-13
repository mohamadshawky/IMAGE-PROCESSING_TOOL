function [ newimage ] = PadingAvarageFilter( image,mask )

[imH imW imD]=size(image);
[maskH maskW]=size(mask);
maskHmid=floor(maskH/2);
maskWmid=floor(maskW/2);
H=imH+(maskHmid*2);
W=imW+(maskWmid*2);

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
                 for s=1:maskH
                     
                        for e=1:maskW
                            newimage(i,j,l)=newimage(i,j,l)+(paddedimage(s+x,e+y,l)* mask(s,e));
                        end
                 end
                 y=y+1;                                  
        end
        x=x+1;
        y=0;
    end
    x=0;
    y=0;
end
    
newimage = im2uint8(newimage);
end

