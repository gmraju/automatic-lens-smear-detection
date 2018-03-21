function out = EdgeLinking(surpr, T_high, T_low)
    
    out = zeros(size(surpr,1), size(surpr,2));
    %Identifying strong edges
    for i = 1:size(surpr,1)
        for j = 1:size(surpr,2)
            if surpr(i,j) > T_high
                out(i,j) =1;
            end
        end
    end
    
    for i = 2:size(surpr,1)-1
        for j = 2:size(surpr,2)-1
            if surpr(i,j) >= T_low && out(i,j) == 0
                out(i,j) = checkneighbors(out, i, j);
            end
        end
    end
end





