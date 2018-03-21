%%%%%Run this script.%%%%%



%%%Complements the aggregated image and performs closing operation on the
%%%image.


%Replace with corresponding camera number, to get mask for that lens smear.
load('mask5.mat'); %Replace with mask1.mat/mask2.mat/mask3.mat/mask5.mat to get the corresponding masks.

%Structuring element for morphological operations.
SE = ones(6);
%Getting complement of the image so that lens smear becomes
%foreground.
img = imcomplement(accImg);
%Converting to binary image
img = im2bw(img);
%Performing Closing by performing Dilation then Erosion
dilatedImg = imdilate(img,SE);
dilatedImg = imdilate(dilatedImg,SE);
erodedImg = imerode(dilatedImg,SE);
finalMask = imerode(erodedImg,SE);

%finalMask is the mask of the lens smear.
%Displaying final lens smear mask.
imshow(erodedImg);