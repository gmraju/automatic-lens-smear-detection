function val = checkneighbors(mag, r, c)

    if mag(r-1,c-1)==1 || mag(r-1,c)==1 || mag(r-1,c+1)==1 || mag(r,c-1)==1 || mag(r,c+1)==1 || mag(r+1,c-1)==1 || mag(r+1,c)==1 || mag(r-1,c+1)==1      
        val = 1;
    else 
        val = 0;

    end
end

