function [x0] = funB(B)
    % vse poraèuna v odvisnosti od A
    % za kviz
    
    a = 0; A = 5; b = 5; l = 12;
    z = isci_z([a,A], [b, B], l, 1, 1e-10);
    v = atanh((B-A)/l) + z;
    u = atanh((B-A)/l) - z;
    C = (b-a) / (v-u);
    D = (a*v - b*u) / (v-u);
    lambda = A - C*cosh((a-D)/C);
    
    w = @(x) C*cosh((x-D)/C) + lambda;
    
    x0 = D;
end