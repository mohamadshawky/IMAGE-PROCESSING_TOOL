function [ gray_image ] = Myrgb2gray( rgb_image,index )
%Myrgb2gray() Function get a rgb image and index of operation and 
%translate it to gray image

%rgb_image = imread(rgb_image);
[H W L]=size(rgb_image);
%gray_image = zeros(H,W);

%rgb_image=double(rgb_image);

% GET GRAY WITH RED LEVEL
if(index==1)
    gray_image=rgb_image(:,:,1);
end

% GET GRAY WITH GREEN LEVEL
if(index==2)
    gray_image=rgb_image(:,:,2);
end

% GET GRAY WITH BLUE LEVEL
if(index==3)
    gray_image=rgb_image(:,:,3);
end

% GET GRAY WITH AVARAGE 
if(index==4)
    gray_image=zeros(H , W);
    for i=1:H
        for j=1:W
            gray_image(i,j,1)= (rgb_image(i,j,1)+rgb_image(i,j,2)+rgb_image(i,j,3))/3;
        end 
    end
    
end

% GET GRAY WITH RATIO 
if(index==5)
    gray_image=zeros(H , W);
    for i=1:H
        for j=1:W
            gray_image(i,j)= 0.3*(rgb_image(i,j,1))+0.5*(rgb_image(i,j,2))+0.25*(rgb_image(i,j,3));
        end 
    end
    
end
gray_image=uint8(gray_image);
%figure,imshow(gray_image);
end

