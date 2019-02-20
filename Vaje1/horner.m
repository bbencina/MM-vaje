function px = horner(a, x)
    % a so koeficienti polinoma, x je to�ka v kateri ra�unamo
    px = a(1)
    for i = 1:length(a)-1
        px = x*px + a(i+1);
    end
end