f = @(x) 1./(1+x);
a = 0; b = 2;

N = 1e+6;

I1 = monte_carlo1(f, a, b, N)

I2 = log((b+1)/(a+1))

% 3D

h = @(x, y, z) x.*y.*z.^2;

a1 = 0; b1 = 1;
a2 = 3; b2 = 5;
a3 = -1; b3 = 1;

N = 1e+7;

I3 = monte_carlo3(h, a1, b1, a2, b2, a3, b3, N)

I4 = 1/12*(b3^3-a3^3)*(b2^2-a2^2)*(b1^2-a1^2)