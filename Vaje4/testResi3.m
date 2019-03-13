n = 4

a = rand(n-1, 1);
b = rand(n, 1);
c = rand(n-1, 1);

A = diag(a, -1) + diag(b) + diag(c, 1);

x = rand(n, 1)

f = A*x;
% tako rešitev mora priti x

x = resi3(a, b, c, f)