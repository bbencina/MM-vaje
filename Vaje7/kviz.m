l = 12;
T1 = [0,5];
T2 = [5,3];
risi_ver(T1, T2, l, 1e-10);

f = @(x) funB(x) - 2.5;
x5 = fzero(f, 5)