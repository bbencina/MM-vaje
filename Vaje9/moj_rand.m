function [P] = moj_rand(p, q, a, c, m, x0)
    % zgenerira matriko P (pxq) nakljuènih števil med 0 in 1
    % na podlagi multiplikativnega kongruenènega generatorja
    %
    % a,c,m - parametri generatorja
    % x0 - seme
    v = zeros(1, p*q);
    x1 = mod(a*x0 + c, m);
    v(1) = x1;
    for i = 2:p*q
        v(i) = mod(a*v(i-1) + c, m);
    end
    P = reshape(v, p, q) ./ m;
end