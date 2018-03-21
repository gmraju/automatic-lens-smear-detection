function [Mag, Theta, Gx, Gy] = ImageGradient(S)
    
    [Gx, Gy] = imgradientxy(S);
    [Mag, Theta] = imgradient(Gx, Gy);

end
