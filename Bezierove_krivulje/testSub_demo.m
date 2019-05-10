b = [0, 1, 3, 2; 0, 2, -2, -4];
c = 1/2;

%[k1, k2] = sub_demo(b, c, 1);

P = pravokotnik(b);
l = [1.5, 1; -1, 1];
seka_pravokotnik(l, P)