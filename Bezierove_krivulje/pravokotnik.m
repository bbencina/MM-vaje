function P = pravokotnik(b)
% PRAVOKOTNIK doloci pravokotnik, ki vsebuje vse kontrolne tocke
% Bezierove krivulje.
% b je tabela 2x(n+1) kontrolnih tock po stolpcih
% Pravokotnik P je dolocen s tabelo 2x4 oglisc po stolpcih
    P = zeros(2, 4);
    r = 0;
    tocki = zeros(2, 2);
    for i = 1:size(b, 2)
        for j = 1:size(b, 2)
            d = norm(b(:,i)-b(:,j));
            if d >= r
                r = d;
                tocki(:,1) = b(:,i);
                tocki(:,2) = b(:,j);
            end
        end
    end
     
    % smerni vektor premice od b0 do bn
    s = tocki(:,2)-tocki(:,1);
    % normala na premico
    n = [0, -1; 1, 0]*s;
    n = n/norm(n);
    
    skal = n'*b;
    M = -Inf;
    m = Inf;
    for i = 1:length(skal)
        if skal(i) > M && skal(i) ~= 0
            M = skal(i);
        end
        if skal(i) < m
            m = skal(i);
        end
    end
%     if M <= 0 && m <= 0
%         M = abs(m);
%         m = 0;
%     elseif M >= 0 && m >= 0
%         m = 0;
%     end
%     M
%     m
            
    A = tocki(:,1)+M.*n;
    B = tocki(:,2)+M.*n;
    C = tocki(:,2)-M.*n;
    D = tocki(:,1)-M.*n;
    P = [A B C D];
    hold on
    axis equal
    plot(P(1,:), P(2,:), '-o');
    plotBezier(b, 0);
    hold off
end