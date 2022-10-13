I = imread('peppers.png');
J = im2bw(I);
K = bwpropfilt(J, 'Area', [115, 175]);
figure(1)
subplot(1,3,1); imshow(I)
subplot(1,3,2); imshow(J)
subplot(1,3,3); imshow(K)
stats = regionprops(K,'Centroid');
stats.Centroid % This will provide the 2D coordinates