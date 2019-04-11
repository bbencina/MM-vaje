function J = jacobian_uv(W, L, vsote_mi)
    % jacobijeva matrika v W sistema u,v
    
    u = W(1); v = W(2);
    
    w = v - u*vsote_mi;
    dkoef = (1 + w.^2).^(-3/2); % v formuli (34) koeficient
    
%     J = [sum(L.*dkoef.*w.*vsote_mi) , sum(-L.*dkoef.*w) ;
%          sum(-L.*dkoef.*vsote_mi) , sum(L.*dkoef)];
     J = [sum(L.*w.*vsote_mi.*dkoef), sum(-L.*w.*dkoef);
    sum(-L.*vsote_mi.*dkoef), sum(L.*dkoef)];
end