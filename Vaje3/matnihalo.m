g = 9.8; l = 10;

zac = [3*pi/4, 0];

tk = 10; 
ts = linspace(0, tk, 300);

f = @(t, y) [y(2) ; -g/l*sin(y(1))];
[ts, Y] = ode45(f, ts, zac);

thetas = Y(:, 1);

nihajni_cas = 4*dif_tangentna(2, 1e-8, 100);
disp(nihajni_cas);

n = length(thetas);
for i = 1:n
    x = [0 l*sin(thetas(i))];
    y = [0 -l*cos(thetas(i))];
    graf = plot(x, y, 'Linewidth', 2);
    axis equal
    axis([-l-1 , l+1 , -l-1 , l+1]);
    pause(0.1);
    delete(graf);
end