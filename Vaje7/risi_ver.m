function [] = risi_ver(T1, T2, l, tol)
    a = T1(1); A = T1(2);
    b = T2(1); B = T2(2);
    z = isci_z(T1, T2, l, 1, tol);
    v = atanh((B-A)/l) + z;
    u = atanh((B-A)/l) - z;
    C = (b-a) / (v-u);
    D = (a*v - b*u) / (v-u);
    lambda = A - C*cosh((a-D)/C);
    
    w = @(x) C*cosh((x-D)/C) + lambda;
    
    %kviz
    w(2)
    dw = @(x) sinh((x-D)/C);
    x0 = D
    w2 = @(x) w(x) - x;
    p = fzero(w2, 1)
    w3 = @(x) w(x) - 4;
    p2 = fzero(w3, 1);
    l1 = C*sinh((b-D)/C) - C*sinh((p2-D)/C)
    
    
    x = linspace(a, b, 100);
    plot(x, w(x)); grid on;
end