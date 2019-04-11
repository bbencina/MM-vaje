function X = ver_uv(W0, zac, L, M)
    % reši verižnico iz sistema za u in v
    % X je 2x(n+2) matrika koordinat vozlišè
    
    %W0...zaè. približek
    %zac...robni toèki
    %L...vrstica dolžin, M...vrstica mas
    
    mi = 0.5 * (M(1:end-1) + M(2:end));
    vsote_mi = [0, cumsum(mi)]; %delne zaporedne vsote mi-jev (33)
    
    % funkcija, ki v odvisnosti od W poda u in v
    sistem = @(W) sistem_uv(W, zac, L, vsote_mi);
    
    % fsolve:
    W = fsolve(sistem, W0);
    
    % newton: PROBLEMI S SINGULARNO MATRIKO
    % funkcija, ki v odvisnosti od W izraèuna jacobi sistema
%     JF = @(W) jacobian_uv(W, L, vsote_mi);
%     
%     W = newton(sistem, JF, W0, 1e-14);
    
    u = W(1); v = W(2);
    
    ksi = L./sqrt(1+(v-u*vsote_mi).^2);
    eta = ksi.*(v-u*vsote_mi);
    
    %enaèbi za xi, yi, direktno nad (20)
    X = [zac(1,1) + cumsum(ksi) ; zac(2,1) + cumsum(eta)];
    X = [zac(:,1) X]; % še prvo vozlišèe na vrh
end