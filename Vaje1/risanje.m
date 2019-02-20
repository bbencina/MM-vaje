f = @(x) sin(x).*exp(sqrt(x));

g1 = @(t) cos(t); g2 = @(t) sin(t);

h1 = g1; h2 = g2; h3 = @(t) t;

k = @(x, y) (x.^2 + y.^2)/(1 + x + y);