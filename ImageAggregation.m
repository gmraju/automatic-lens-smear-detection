%%%%This file does not need to be run. %%%%  
%%%%Output of this script is included as .mat files%%%%

%Method description:
%. Canny Edge detector is used for isolating the lens smear in the pictures.

%. Due to the granular nature of the images, Canny detector also highlights
%    most of the image into countless individual segments.

%. This process is carried out for each image in the given set of images. 
%    The binary images resulting from canny edge detection are aggregated 
%    into a single image.

%. Once all the images have been parsed, the resultant aggregate of the 
%    detected edges is obtained. This result is essentially a binary image with
%    everything except the lens smear set to 1.

%. We take the complement of this resultant image to get the mask of the
%    smear.

%. The mask is broken at places due to noise in the image during the edge
%    detection process. We perform closing operation on it to fill up the
%    holes (dilation followed by erosion.)



%%%Performs edge detection and creates the accumulated image.

%Notes: . There is no need to run this script as the aggregated images for
%         each camera have already been saved as .mat files and included in this
%         submission.

%       . Replace path below with the path of the path for each camera's output pictures  





%Reading first image file from the path and setting the accumulated image as the binary edge image of the first photo.
% (Since we do not know the size of the images this solves the problem of having to create an empty array of the same size. 
img_src = dir('insert file path here\*.jpg');
filename = strcat('insert file path here\',img_src(1).name);
img = imread(filename);
%converting image to grayscale
imgGray = rgb2gray(img);

%Storing the first edge detected image in 'accumulating matrix'
accImg = edge(imgGray, 'Canny');

%Reading reamining image files from the specified directory, calculating their 
%edge detected images and adding to the accumulating matrix.
img_src = dir('insert file path here\*.jpg');  
for i = 2 : length(img_src)-1
    filename = strcat('insert file path here\',img_src(i).name);
    newImg = imread(filename);
    disp(i);
    newImg = rgb2gray(newImg);
    
    %Detecting edges using Canny edge detection algorithm.
    edgeImg = edge(newImg, 'Canny');
    %Adding the new edges to the accumulating matrix.
    accImg = accImg+edgeImg;
    
end

%Saving the accumulated/aggregated image matrix for later processing.
save('mask1.mat', 'accImg'); 

%Displaying the aggregated image.
figure;
imshow(accImg);
