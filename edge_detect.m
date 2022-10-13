%% load image
img = imread('peppers.png');
figure(1), imshow(img);
%% Binarization
img = rgb2gray(img);
BW = img > 50;
figure(2), imshow(BW);
size(BW)
%% mask white area
[yi,xi] = find(BW == 0);
BW = BW(min(yi):max(yi),min(xi):max(xi));
figure(3), imshow(BW); hold on;
size(BW)
%% Detect Lines by Hough transform
[H, t, r] = hough(BW,'Theta',[-90:0.01:89.9]); % finer theta sampling
peaks = houghpeaks(H, 8); % the number of lines seen in the image.
lines = houghlines(BW, t, r, peaks, 'FillGap', 100);
% visualization
for i = 1:length(lines)
    plot([lines(i).point1(1) lines(i).point2(1)],...
         [lines(i).point1(2) lines(i).point2(2)], 'r-');
end
%% get intersection points
% simple approach using image analysis.
% 1. add 1 into the pixel on the line.
% 2. repeat Step 1 for all the lines.
% 3. pick up the pixels where the value is 2.
lineSum = zeros(size(BW));
for i = 1:length(lines)
    x1 = lines(i).point1(1);
    x2 = lines(i).point2(1);
    y1 = lines(i).point1(2);
    y2 = lines(i).point2(2);
    
    if x1 == x2 % extreme case
        lineSum(y1:sign(y2-y1):y2,x1) = lineSum(y1:sign(y2-y1):y2,x1) + 1;
    else
        x_pos = linspace(x1, x2, max([abs(x2-x1)+1,abs(y2-y1)+1])); % x-coordinate of the pixels on the line
        y_pos = interp1([x1 x2],[y1 y2], x_pos); % y-coordinate of the pixels on the line
        x_pos = round(x_pos);
        y_pos = round(y_pos);
        linInd = sub2ind(size(BW), y_pos, x_pos);
        lineSum(linInd) = lineSum(linInd) + 1;
    end        
end
[r, c] = find(lineSum == 2);
figure(1), hold on;
plot(min(xi)+c-1, min(yi)+r-1, 'rx'); % plot intersection points on the original image coordinate