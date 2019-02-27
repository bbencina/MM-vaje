function [] = risi_kroznico(trikotnik)
    % za trikotnik podan z oglišèi narišemo oèrtano in vèrtano krožnico
    
    % za središèe oèrtane krožnice potrebujemo preseèišèe simetral daljic
    
    % za središèe oèrtane krožnice potrebujemo preseèišèe simetral kotov
    
    A = trikotnik(:,1);
    B = trikotnik(:,2);
    C = trikotnik(:,3);
    da = norm(C-B);
    db = norm(A-C);
    dc = norm(B-A);
    s = (da+db+dc)/2; %polobseg
    S = sqrt(s*(s-da)*(s-db)*(s-dc)); %plošèina
    
    % središèe oèrtanega
    %   simetrala a
    Ta = (C+B)./2;
    Sa = (C-B); Sa(1:2,:) = Sa(2:-1:1,:); Sa(1) = -Sa(1);
    
    %   simetrala b
    Tb = (A+C)./2;
    Sb = (A-C); Sb(1:2,:) = Sb(2:-1:1,:); Sb(1) = -Sb(1);
    
    %   preseèišèe simetral daljic
    koef = (Tb-Ta)\[Sa , -Sb];
    PO = Ta + koef(1).*Sa;
    
    % radij oèrtanega
    R = norm(PO-A);
    
    % središèe vèrtanega
    %   simetrala kota pri A
    SA = (C-A)./db+(B-A)./dc;
    
    %   simetrala kota pri B
    SB = (C-B)./da+(A-B)./dc;
    
    %   preseèišèe simetral kotov
    koef = (B-A)\[SA , -SB];
    Po = A + koef(1).*SA;
    
    % radij vèrtanega
    r = S/s;
    
    % risanje
    hold on
    t = linspace(0, 2*pi, 200);
    O1 = R.*cos(t) + PO(1);
    O2 = R.*sin(t) + PO(2);
    plot(O1, O2);
    
    o1 = r.*cos(t) + Po(1);
    o2 = r.*sin(t) + Po(2);
    plot(o1, o2);
    
    trikotnik = [trikotnik, trikotnik(:, 1)];
    plot(trikotnik);
    
    hold off
    
end