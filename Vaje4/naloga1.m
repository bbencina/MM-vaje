st_tock = 100;
radij = 1;
func = @(x) 1;

[r,u] = opno(st_tock, radij, func);
u
plot(r, u);

%polar3d(flipud(u)*ones(1, st_tock), 0, 2*pi, 0, radij, 0.5)
