function output = NonmaximaSupress(Theta, Mag) 

    rows=size(Theta,1);
    cols=size(Theta,2);
    
    for i=2:rows-1
        for j=2:cols-1
            if (Theta(i,j)>=-22.5 && Theta(i,j)<=22.5) || (Theta(i,j)<-157.5 && Theta(i,j)>=-180)
                Theta(i,j)= 1;
                
            elseif (Theta(i,j)>=22.5 && Theta(i,j)<=67.5) || (Theta(i,j)<-112.5 && Theta(i,j)>=-157.5)
                Theta(i,j)= 2;
                
            elseif (Theta(i,j)>=67.5 && Theta(i,j)<=112.5) || (Theta(i,j)<-67.5 && Theta(i,j)>=-112.5)
                Theta(i,j)= 3;
                
            elseif (Theta(i,j)>=112.5 && Theta(i,j)<=157.5) || (Theta(i,j)<-22.5 && Theta(i,j)>=-67.5)
                Theta(i,j)= 4;
            end
        end
    end
    
    output = zeros(rows,cols);
    for i=2:rows-1
        for j=2:cols-1
            if (Theta(i,j)==1)
                if (Mag(i,j) == max([Mag(i,j), Mag(i,j+1), Mag(i,j-1)]))
                    output(i,j) = Mag(i,j);
                end
                
            elseif (Theta(i,j)==2)
                if (Mag(i,j) == max([Mag(i,j), Mag(i+1,j-1), Mag(i-1,j+1)]))
                    output(i,j) = Mag(i,j);
                end
                
            elseif (Theta(i,j)==3)
                if (Mag(i,j) == max([Mag(i,j), Mag(i+1,j), Mag(i-1,j)]))
                    output(i,j) = Mag(i,j);
                end
                
            elseif (Theta(i,j)==4)
                if (Mag(i,j) == max([Mag(i,j), Mag(i+1,j+1), Mag(i-1,j-1)]))
                    output(i,j) = Mag(i,j);
                end
            end
        end
    end
    
    for i = 1:rows
        output(rows,i) = 0;
        output(1,i) = 0;
    end
    
    for i = 1:cols
        output(i,cols) = 0;
        output(i,1) = 0;
    end
end