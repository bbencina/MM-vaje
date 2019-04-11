function Z = sistem_uv(W, zac, L, vsote_mi)
    
    u = W(1); v = W(2);
    
    ksi = L ./ sqrt(1 + (v - u*vsote_mi).^2);
    eta = ksi .* (v - u*vsote_mi);
    
    Z = [sum(ksi) - (zac(1,2)-zac(1,1)) ;
         sum(eta) - (zac(2,2)-zac(2,1))];
end