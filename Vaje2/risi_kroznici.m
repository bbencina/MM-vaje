function [] = risi_kroznico(trikotnik)
    % za trikotnik podan z ogli��i nari�emo o�rtano in v�rtano kro�nico
    
    % za sredi��e o�rtane kro�nice potrebujemo prese�i��e simetral daljic
    
    % za sredi��e o�rtane kro�nice potrebujemo prese�i��e simetral kotov
    
    A = trikotnik(:,1);
    B = trikotnik(:,2);
    C = trikotnik(:,3);
    da = norm(C-B);
    db = norm(A-C);
    dc = norm(B-A);
    s = (da+db+dc)/2; %polobseg
    S = sqrt(s*(s-da)*(s-db)*(s-dc)); %plo��ina
    
    % sredi��e o�rtanega
    %   simetrala a
    Ta = (C+B)./2;
    Sa = (C-B); Sa(1:2,:) = Sa(2:-1:1,:); Sa(1) = -Sa(1);
    
    %   simetrala b
    Tb = (A+C)./2;
    Sb = (A-C); Sb(1:2,:) = Sb(2:-1:1,:); Sb(1) = -Sb(1);
    
    %   prese�i��e simetral daljic
    koef = (Tb-Ta)\[Sa , -Sb];
    PO = Ta + koef(1).*Sa;
    
    % radij o�rtanega
    R = norm(PO-A);
    
    % sredi��e v�rtanega
    %   simetrala kota pri A
    SA = (C-A)./db+(B-A)./dc;
    
    %   simetrala kota pri B
    SB = (C-B)./da+(A-B)./dc;
    
    %   prese�i��e simetral kotov
    koef = (B-A)\[SA , -SB];
    Po = A + koef(1).*SA;
    
    % radij v�rtanega
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