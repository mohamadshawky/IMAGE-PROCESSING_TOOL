function [ newimage ] = DuplicatingAvarageFilter( image,mask )
[imH imW imD]=size(image);
[maskH maskW]=size(mask);
maskHmid=floor(maskH/2);
maskWmid=floor(maskW/2);
H=imH+(maskHmid*2);
W=imW+(maskWmid*2);
Duplicatedimage=zeros(H,W);
newimage=zeros(imH,imW,imD);
image=im2double(image);

for d=1:imD
    for i=1+maskHmid:H-maskHmid
        for j=1+maskWmid:W-maskWmid
            Duplicatedimage(i,j,d)=image(i-maskHmid,j-maskWmid,d);
        end
    end
end

h=1;
w=1;

for d=1:imD
    for i=1+maskHmid:imH+maskHmid
        for j=1:maskWmid
            Duplicatedimage(i,j,d)=image(h,w,d);
            w=w+1;
        end
        h=h+1;
        w=1;
    end
    h=1;
end

for d=1:imD
    for i=1:H
        for j=0:maskWmid-1
            Duplicatedimage(i,W-j,d)=Duplicatedimage(i,W-j-maskWmid,d);
        end
    end
end

for d=1:imD
    for i=1:maskHmid
        for j=1:W
         Duplicatedimage(i,j,d)=Duplicatedimage(i+maskHmid,j);
        end
    end
end
for d=1:imD
    for i=0:maskHmid-1
        for j=1:W
           Duplicatedimage(H-i,j,d)=Duplicatedimage(H-i-maskHmid,j,d);
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Duplicatedimage=double(Duplicatedimage);
 x=0;
 y=0;
for l=1:imD
    for i=1:imH
        for j=1:imW
           
                 for s=1:maskH
                     
                        for e=1:maskW
                            newimage(i,j,l)=newimage(i,j,l)+(Duplicatedimage(s+x,e+y,l)* mask(s,e));
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

