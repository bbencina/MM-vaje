g = 9.8

T1 = [0, 5];
T2 = [3, 1];
a = T1(1); A = T1(2);
b = T2(1); B = T2(2);
[theta, k] = risi_brah(T1, T2);

% Èas:
% - brahistohrona med [0,0] in T2
%dx = 0.5 * k^2 * (1 - cos(t)) * dt
% => dx = -y * dt
% => y'(t) = dy/dx = (dy/dt)*(dt/dx) = ... = -sin(t)/(1-cos(t))
% => t = integral[0, t*]{(sqrt(1 + sin^2(t)/(1-cos(t))^2) /
% (-2*g*0.5*k^2(1-cos(t))) * (0.5*k^2*(1-cos(t))dt} =
% = ... = sqrt(k^2/0.5/g) * int[0, t*]{dt} = t* * k / sqrt(2*g)
%
% - premica med [0,0] in T2
% y = B/b * x  => y' = B/b
% => t = int[0, b]{sqrt((1 + (B/b)^2) / (-2g*B/b*x))} =
% = ... = sqrt((2(B^2 + b^2)) / (-gB))

disp('Èas potovanja po brahistohroni: ');
cas_brah = theta * k / sqrt(2*g)

disp('Èas potovanja po premici: ');
cas_prem = sqrt((2*((B-A)^2 + (b-a)^2)) / (-g*(B-A)))

% Najnižja toèka:
% potrebno bo poiskati nièle odvoda y(t)
% y'(t) = -0.5*k^2*sin(t) = 0
% za t = 0 dobimo maksimum (zaè. toèko)
% ta t = pi dobimo minimum
% ta odgovor bo pravilen, le bo t* >= pi.
% èe t* <= pi, je odgovor kar T2

disp('Najnižja toèka: ');
if (theta >= pi)
    x = 0.5 * k^2 * (pi - sin(pi));
    y = -0.5 * k^2 * (1 - cos(pi));
    tocka = [x + a, y + A];
else
    tocka = T2;
end
tocka

% Dolžina loka:
% l = int[0, t*]{sqrt(x'^2 + y'^2)dt}
%   = ... 
%   = k^2/sqrt(2) * int[0, t*]{sqrt(1-cos(t))}
%   = k^2/sqrt(2) * int[0, t*]{sqrt(1 - cos^2(t/2) + sin^2(t/2))}
%   = k^2/sqrt(2) * int[0, t*]{sqrt(2) * abs(sin(t/2))}
% //ker t < 2*pi, abs pozabimo
%   = ...
%   = -2*k^2(cos(t*/2) - 1)

disp('Dolžina loka: ')
l = -2*k^2*(cos(theta/2) - 1)