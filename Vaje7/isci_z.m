function z = isci_z(T1, T2, l, z0, tol)
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