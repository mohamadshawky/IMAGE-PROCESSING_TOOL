function [ Newimage ] = GRAYOptions( image,index )
%GRAYOPTIONS Summary of this function goes here
%   Detailed explanation goes here
[H,W,D]=size(image);
Newimage=zeros(H,W,3);

%%%%%% Red Ony %%%%%%%5
if(index==1)
    Newimage(:,:,1)=image(:,:,1);
    Newimage(:,:,2)=0;
    Newimage(:,:,3)=0;
end

%%%%%%%%% Green Only %%%%%%%%%%
if(index==2)
    Newimage(:,:,2)=image(:,:,1);
    Newimage(:,:,1)=0;
    Newimage(:,:,3)=0;
end

%%%%%%%% Bleu Only %%%%%%%
if(index==3)
    Newimage(:,:,3)=image(:,:,1);
    Newimage(:,:,1)=0;
    Newimage(:,:,2)=0;
end

%%%%%%% Rad & Green %%%%%%%%
if(index==4)
    Newimage(:,:,1)=image(:,:,1);
    Newimage(:,:,2)=image(:,:,1); 
    Newimage(:,:,3)=0;
    
end

%%%%%%% Red & Blue &&&&&&&&&
if(index==5)
    Newimage(:,:,1)=image(:,:,1);
    Newimage(:,:,3)=image(1); 
    Newimage(:,:,2)=0;
end

%%%%%%%%% Green & Bleu &&&&&&&&&
if(index==6)
    Newimage(:,:,2)=image(:,:,1);
    Newimage(:,:,3)=image(3); 
    Newimage(:,:,1)=0;
end
Newimage=uint8(Newimage);
end

