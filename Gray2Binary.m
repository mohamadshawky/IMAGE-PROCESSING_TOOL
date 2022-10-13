function [ bin ] = Gray2Binary( image )

%image = imread(image);

[H W L] = size(image);

if L == 3
    image = RGBToGray(image, 4);
end

image = double(image);
bin = zeros(H, W);

for i = 1 : H
    for j = 1 : W
        if image(i, j) > 128
            bin(i, j) = 1;
        else
            bin(i, j) = 0;
        end                 
    end
end

bin = logical(bin);
end