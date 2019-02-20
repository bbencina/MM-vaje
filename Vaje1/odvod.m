function odv = odvod(p)
    n = length(p);
    odv = zeros(1, n-1);
    for i = 1:n-1
        odv(i) = p(i)*(n-i);
    end
    
    %ali
    odvod(n-1:-1:1).*p(1:n-1);
end