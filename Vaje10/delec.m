function [T,info] = delec(a,N,risi)
% DELEC izrise potovanje delca po kvadratu. 
% T je tabela delezev prehodov delca skozi eno od stranic
% kvadrata [-a,a]x[-a,a].
% N stevilo simulacij.
% Delec se na zacetku nahaja v (0,0), korak je 1
% kvadrat centriramo v (0,0)
    smeri = zeros(1, 4);
    
    for i = 1:N
        tocka = zeros(1, 2);
        if risi == 1
            clf
            grid on
            hold on
            axis([-a, a, -a, a])
            plot(tocka(1), tocka(2), 'o');
        end
        while 1
            if risi == 1
                pause(0.1);
            end
            smer = randi(4);
            nova_tocka = tocka;
            switch smer
                case 1
                    nova_tocka(1) = tocka(1) + 1;
                case 2
                    nova_tocka(2) = tocka(2) + 1;
                case 3
                    nova_tocka(1) = tocka(1) - 1;
                case 4
                    nova_tocka(2) = tocka(2) - 1;
            end
            if risi == 1
                plot([tocka(1), nova_tocka(1)], [tocka(2), nova_tocka(2)], '-o');
            end
            tocka = nova_tocka;
            %plot(nova_tocka(1), nova_tocka(2), 'o');
            if tocka(1) == a
                smeri(1) = smeri(1) + 1;
                break
            elseif tocka(2) == a
                smeri(2) = smeri(2) + 1;
                break
            elseif tocka(1) == -a
                smeri(3) = smeri(3) + 1;
                break
            elseif tocka(2) == -a
                smeri(4) = smeri(4) + 1;
                break
            else
                continue
            end
        end
    end
    T = smeri ./ N;
    info = ['desno', 'gor', 'levo', 'dol'];
end