function S = GaussSmoothing(I, N, sigma)
 
    Gmask = fspecial('gaussian', [N,N], sigma);
    S = conv2(I, Gmask, 'same');

end