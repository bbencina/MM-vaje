function z = isci_z(T1, T2, l, z0, tol)
% ISCI_Z resi enacbo z = asinh(ro*z) za
% zvezno veriznico. Pri tem so:
% ro = l/(b-a)*sqrt(1-((B-A)/l)^2),
% T1 in T2 sta krajisci veriznice oblike T1(a,A) in
% T2(b,B),
% l je dolzina veriznice,
% z0 zacetni priblizek
% tol je toleranca, ki doloca natancnost priblizka
% pri navadni iteraciji.
    a = T1(1); A = T1(2);
    b = T2(1); B = T2(2);
    ro = l/(b-a)*sqrt(1-((B-A)/l)^2);
    z1 = 0;
    z2 = z0;
    while 1
        z1 = z2;
        z2 = asinh(ro*z1);
        if abs(z2 - z1) < tol
            break;
        end
    end
    z = z2;
end