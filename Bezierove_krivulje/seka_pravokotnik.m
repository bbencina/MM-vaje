function seka = seka_pravokotnik(l,P)
% SEKA_PRAVOKOTNIK doloci, ali premica l seka pravokotnik P ali ne.
% Premica l je podana v obliki l = [tocka, smerni].
% Pravokotnik P je dolocen s tabelo 2x4 oglisc po stolpcih
    
    % normala na premico
    n = [0, -1; 1, 0]*l(:,2);
    n = n/norm(n);
    %vektorji od toèke do oglišè pravokotnika
    vekt = P - [l(:,1) l(:,1) l(:,1) l(:,1)];
    skal = n'*vekt;
    pred = sign(skal);
    % ali vsi ležijo na isti polravnini
    if abs(sum(pred)) == 4
        seka = 0;
    else
        seka = 1;
    end
end