function [ gray ] = RGBToGray( image, index )
  
[H W L]=size(image);
rgb1=double(image);
gray=zeros(H,W);

if index==1
    for i=1:H
        for j=1:W
            gray(i,j,1)=rgb1(i,j,1);
        end
    end
elseif index==2
    for i=1:H
        for j=1:W
            gray(i,j,1)=rgb1(i,j,2); 
        end
    end
elseif index==3
    for i=1:H
        for j=1:W
            gray(i,j,1)=rgb1(i,j,3);
        end
    end

elseif index==4
    for i=1:H
        for j=1:W
            gray(i,j,1)=(rgb1(i,j,1)+rgb1(i,j,2)+rgb1(i,j,3))/3;
        end
    end
elseif index==5
    for i=1:H
        for j=1:W
            gray(i,j,1)=0.5*rgb1(i,j,1)+0.4*rgb1(i,j,2)+0.1*rgb1(i,j,3);
        end
    end

end    
image=uint8(image);
gray=uint8(gray);

end

