b = 37;
A = [0,0]; B = [3,0];
zac = [A' B'];
M = [2 + b/100, 3.4, 0.8, 1 + b/100, 0.6, 3.1];
L = [1, 1, 1, 1, 1, 1];
g = 9.8;

W0 = [-1; 1];

% 1) Vsota koordinat težišèa
X = ver_uv(W0, zac, L, M);
xs = X(1,:); ys = X(2,:);
tez_x = 0.5 * (xs(1:end-1) + xs(2:end));
tez_y = 0.5 * (ys(1:end-1) + ys(2:end));

tez = [sum(M.*tez_x) ; sum(M.*tez_y)] ./ sum(sum(M));

disp('Koordinate težišèa: ');
tez
disp('Vsota: ');
tez(1) + tez(2)

% 2) Potencialna energija
%minimiziramo y koordinato težišèa
l = length(L);
p = perms(1:size(L,2));
mini = Inf;
for i = 1:size(p,1)
    Y = ver_uv(W0, zac, L, M(p(i,:)));
    Ys = Y(2,:);
    tez_y = 0.5 * (Ys(1:end-1) + Ys(2:end));
    y = sum(M(p(i,:)).*tez_y) / sum(sum(M));
    if y < mini
        mini = y;
        p0 = p(i,:)
        Y0 = Y;
    end
end
mini
Y0
pot_en = mini * g * sum(sum(M))



% 3)
B = B + [0,1];
zac = [A' B'];
risi_ver(zac, L, M);
X = ver_uv(W0, zac, L, M);
xs = X(1,:); ys = X(2,:);
n = length(xs);

area = 0;
T1 = X(:,1);
for i = 2:n-1
    T2 = X(:,i); T3 = X(:,i+1);
    t = abs(T1(1)*(T2(2)-T3(2)) + T2(1)*(T3(2)-T1(2)) + T3(1)*(T1(2)-T2(2)))*0.5;
    area = area + t;
end


disp('Plošèina: ');
area
