a = 1;
n = 32;
tol = 1e-5;
f = @(x) 1-x.^2;

colormap(jet)
milnica(a, n, f, f, f, f, tol, 'Jacobi')

figure
colormap(jet)
milnica(a, n, f, f, f, f, tol, 'Gauss-Seidl')