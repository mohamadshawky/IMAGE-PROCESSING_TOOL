function [ binary ] = to_binary( gray1 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%gray1=imread(gray1);
bin = Gray2Binary(gray1);
binary=double(bin);
%figure,imshow(binary),title('bin picture');
end

