

 
ii=0;
for i=0:29
   close all;
    ii= ii+1;
s = strcat(int2str(ii),'.jpg')
ori = imread(s);
subplot(1,2,1);imshow(ori);
subplot(1,2,2);imshow(pic);

BW = rgb2gray(ori);        %gray scale






hsize = 10;
sigma = 200;
h = fspecial('gaussian',hsize,sigma);       %gaussian
gaussian = imfilter(BW,h);


pic = edge(gaussian,'canny',[0.01 0.05]);        %canny edge 
% figure; imshow(pic);


S = strel('disk', 2);  %dilation
I2 = imdilate(pic,S);


B = im2bw(uint8(I2), graythresh(uint8(I2))); % Threshold image

imshow(B);

L = bwlabel(B); % Do connected component labeling

blobs = regionprops(L); % Get region properties

for i=1:length(blobs)

% Draw a rectangle around each blob
if blobs(i).BoundingBox(3)>20 && blobs(i).BoundingBox(3)< 450 && blobs(i).BoundingBox(4)<450 && blobs(i).BoundingBox(4)>10
    

rectangle('Position', blobs(i).BoundingBox, 'EdgeColor', 'r');

end
end
pause;

end

