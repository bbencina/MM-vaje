function [] = milnica(a, n, f_spodaj, f_zgoraj, f_levo, f_desno, tol, metoda)
    x = linspace(-a, a, n+2);
    U = zeros(n+2);
    U(1, :) = f_zgoraj(x);
    U(end, :) = f_spodaj(x);
    U(:, 1) = f_levo(x);
    U(:, end) = f_desno(x);
    
    switch metoda
        case 'Jacobi'
            jacobi(U, tol, a);
        case'Gauss-Seidl'
            gauss_seidl(U, tol, a);
    end
end