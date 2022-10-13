function [ newimage ] = Sharpening( image, maskIndex, index )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%image = imread(image);

if( maskIndex == 1 )
    mask = [0 -1 0; -1 5 -1; 0 -1 0];
end
if( maskIndex == 2 )
    mask = [-1 -1 -1; -1 9 -1; -1 -1 -1];
end

if( maskIndex == 3 )
    mask = [1 2 1; 0 1 0; -1 -2 -1];
end
if( maskIndex == 4 )
    mask = [1 0 -1; 2 1 -2; 1 0 -1];
end

if( maskIndex == 5 )
    mask = [0 1 2; -1 1 1; -2 -1 0];
end
if( maskIndex == 6 )
    mask = [2 1 0; 1 1 -1; 0 -1 -2];
end
if( maskIndex == 7 )
    mask = [0 1 0; 0 1 0; 0 -1 0];
end
if( maskIndex == 8 )
    mask = [0 0 0; 1 1 -1; 0 0 0];
end
if( maskIndex == 9 )
    mask = [0 0 1; 0 1 0; -1 0 0];
end
if( maskIndex == 10 )
    mask = [1 0 0; 0 1 0; 0 0 -1];
end

if(index==1)
    newimage=IgnorAvarageFilter(image,mask);
end
if(index==2)
    newimage=PadingAvarageFilter(image,mask);
end
if(index==3)
    newimage=DuplicatingAvarageFilter(image,mask);
end
[NH NW NL] = size(newimage);
newimage=abs(newimage);

for l=1:NL
    for i=1:NH
        for j=1:NW
            if( newimage(i,j,l) >= 255 )
                newimage(i,j,l) = 255;
            end
            if( newimage(i,j,l) <= 0 )
                newimage(i,j,l) = 0;
            end
        end
    end
end

%newimage=uint8(newimage);
%figure,imshow(newimage),title('Edged Image');

end

