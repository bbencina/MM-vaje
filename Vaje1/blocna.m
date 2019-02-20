function [A] = blocna(n)
    % Funkcija zgenerira blocno matriko n^2*n^2 iz navodil.
    
    A = diag(-4.*ones(n^2, 1));
    obdiagonala = ones(n^2-1, 1);
    obdiagonala(n:n:n^2-1) = 0;
    A = A + diag(obdiagonala,1) + diag(obdiagonala,-1);
    A = A + diag(ones(n^2-n,1), n) + diag(ones(n^2-n,1), -n);
end