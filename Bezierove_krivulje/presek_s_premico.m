function Tp = presek_s_premico(b,l,tol)
% PRESEK_S_PREMICO poisce presek ravninske Bezierove krivulje 
% s premico l podano s tocko P in smernim vektorjem s
% 
% Tp je tabela tock presecisc (ce ni presecisca, vrne prazno matriko)
% b je tabela 2x(n+1) kontrolnih tock po stolpcih
% l = [P,s]
% tol je natancnost, do katere isce presecisce.
    Tp = [];
    P = pravokotnik(b);
    
    if ~seka_pravokotnik(l, P)
        return
    else
        if norm(P(:,2)-P(:,1)) < tol && norm(P(:,4)-P(:,1)) < tol
            Tp = [Tp 0.25*sum(P,2)];
        else
            [k1, k2] = sub_demo(b, 0.5, 0);
            Tp1 = presek_s_premico(k1, l, tol);
            Tp2 = presek_s_premico(k2, l, tol);
            Tp = [Tp Tp1 Tp2];
        end
    end
        
end