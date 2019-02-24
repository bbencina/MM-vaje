f = @(x) sin(x).*exp(sqrt(x));
%xs = 1:0.1:3;
%plot(xs, f(xs));

g1 = @(t) cos(t); g2 = @(t) sin(t);
%ts = 0:2*pi/100:2*pi;
%plot(g1(ts), g2(ts));

h1 = g1; h2 = g2; h3 = @(t) t;
%ts = 0:2*pi/100:10*pi;
%plot3(h1(ts), h2(ts), h3(ts));

k = @(x, y) (x.^2 + y.^2)./(1 .+ x .+ y);
[xs,ys] = meshgrid(0:0.05:1,0:0.05:1);
surf(xs, ys, k(xs, ys));
view(3);