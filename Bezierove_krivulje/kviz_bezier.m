% Dana je Bezierjeva krivulja c:[0,1]->R^2
b = [0, 1, 2, 4; 0, -1, -1, 2];

format long

% 1) abscica toèke c(0.5)?
t1 = deCasteljau(b, 0.5);
t1(1)

% 2) Vrednost druge norme odvoda v 0.5?
[der,db] = bezier_der(b, 0.5);
norm(der)

% 3) Oddaljenost c(0.5) od KO?
norm(t1-[0;0])

% 4) Predznaèena ukrivljenost v c(0.5)?
[der2, d2b] = bezier_der(db, 0.5);
K1 = (der(1)*der2(2)-der2(1)*der(2)) / norm(der)^3

% 5) Izvedi korak subdivizije pri 0.4. Vsota ordinat kontrolnih toèk
% prvega dela.
[kont1, kont2] = sub_demo(b, 0.4, 0);
sum(kont1(2, :))

% 6) Kakšna je abscisa preseèišèa krivulje s premico y = 1-x?
P = [0;1]; s = [1;-1];
l = [P s];
tol = 1e-12;
t2 = presek_s_premico(b, l, tol);
t2(1)

% 7) Dvignemo krivuljo za 1 stopnjo. Vsota abscis?
b2 = bezier_dvigni(b);
sum(b2(1,:))

% 8) Kdaj je tangentni vektor vzporeden abscisni osi?
tang = @(t) kviz_pomozna(b, t);
fzero(tang, 0.5)

% 9)
A = [2 ; 0.5];
f = @(t) dot(bezier_der(b, t), deCasteljau(b, t)-A);
t = fzero(f, 0.5);
t3 = deCasteljau(b, t);
norm(t3 - A)

