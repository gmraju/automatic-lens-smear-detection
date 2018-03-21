im = imread('393408628.jpg');
img = double(rgb2gray(im));

rows = size(img, 1);
cols = size(img, 2);
%figure; imshow(img); title('Original');

%Gaussian Smoothing
Sigma = 3;
N = 2;
img_filtered = GaussSmoothing(img, N, Sigma);
%Displaying smoothed image
figure; imshow(uint8(img_filtered));
set(gcf,'numbertitle','off','name','Gaussian Smoothing')

%Finding Image Gradient
[Mag, Theta] = ImageGradient(img_filtered);
figure; imshow(mat2gray(Mag)); 
set(gcf,'numbertitle','off','name','Magnitude of Image Gradient')

%Calculating histogram for gradient
image = uint8(255*mat2gray(Mag));
histo = imhist(image);
[T_low, T_high] = FindThreshold(image, 80);


%Non-maxima Surpression
surpr = NonmaximaSupress(Theta, Mag);
%Displaying output of non-maxima surpression
figure; imshow(mat2gray(surpr));
set(gcf,'numbertitle','off','name','Non-maxima Surpression')


surpr = uint8(255*mat2gray(surpr));
out = zeros(rows,cols);

    %out = zeros(size(surpr,1), size(surpr,2));

    for i = 1:size(surpr,1)
        for j = 1:size(surpr,2)
            if surpr(i,j) > T_high
                out(i,j) =1;
            end
        end
    end
    
    for i = 1:rows
        for j = 2:cols
            if surpr(i,j) >= T_low && out(i,j) == 0 && T_low>0
                out(i,j) = checkneighbors(out, i, j);
            end
        end
    end


%Edge Linking by Hysteresis thresholding
%out = EdgeLinking(surpr, T_high, T_low);
%Displaying final image
figure; imshow(out);
set(gcf,'numbertitle','off','name','Edge Linking')







