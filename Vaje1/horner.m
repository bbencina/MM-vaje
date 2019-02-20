function px = horner(a, x)
    % a so koeficienti polinoma, x je toèka v kateri raèunamo
    px = a(1)
    for i = 1:length(a)-1
        px = x*px + a(i+1);
    end
end