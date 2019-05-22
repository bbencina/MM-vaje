function b2 = bezier_dvigni(b)
% Dvigne stopnjo bezierjeve krivulje za 1 in vrne nove kontrolne toèke.
% b2(j) = (1 - j/(n+1))*b(j) + j/(n+1)*b(j-1)
    
    n = size(b, 2)-1;
    b2 = zeros(2, n+2);
    b2(:,1) = b(:,1); b2(:,end) = b(:,end);
    for j = 2:n+1
        b2(:,j) = (1 - (j-1)/(n+1))*b(:,j) + (j-1)/(n+1) * b(:,j-1);
    end
end