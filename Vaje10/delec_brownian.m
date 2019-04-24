function [T,info] = delec_brownian(a, b, poz, delta, N)
% Simulacija: Zacni v dani poziciji poz v pravokotniku [-a,a]x[-b,b]
% in poisci najvecji krog, ki ga lahko vrises v ta pravokotnik.
% Pojdi v nakljucno tocko na tem krogu in ce je razdalja do roba
% manjsa kot delta, %stej da si presel stranico.
% T je tabela delezev prehodov delca skozi eno od stranic pravokotnika.
% N je stevilo simulacij
    smeri = zeros(1, 4);
    for i = 1:N
        p = poz;
        while 1
            radij = min([a, b] - abs(p));
            kot = 2*pi*rand();
            tocka = p + [radij * cos(kot), radij * sin(kot)];
            if a-tocka(1) <= delta
                smeri(1) = smeri(1) + 1;
                break
            elseif b-tocka(2) <= delta
                smeri(2) = smeri(2) + 1;
                break
            elseif a-abs(tocka(1)) <= delta
                smeri(3) = smeri(3) + 1;
                break
            elseif b-abs(tocka(2)) <= delta
                smeri(4) = smeri(4) + 1;
                break
            else
                p = tocka;
                continue
            end
        end
    end
    T = smeri ./ N;
    info = ['desno', 'gor', 'levo', 'dol'];
end