function [T_low, T_high] = FindThreshold(histogram, percentageOfNonEdge)

    p = histogram';
    h = p(:);
    freq = zeros(256,1);
    pdf = zeros(256,1);
    cdf = zeros(256,1);
    mn = size(h,1)*size(h,2);
    
    for i =1 : size(h,1)
        for j = 1:size(h,2)
            val = h(i,j);
            freq(val+1) = freq(val+1)+1;
            pdf(val+1) = freq(val+1)/mn;
        end
    end
    
    sum = 0;  
    for i=1:size(pdf)
        sum = sum + freq(i);
        cum(i) = sum;
        cdf(i) = cum(i)/mn;
    end
    
    counter = 0;
    for i =1:256
        if cdf(i) <= percentageOfNonEdge/100;
            counter = counter +1;
        end
    end
    T_high = counter;
    T_low = floor(counter/2);  
end