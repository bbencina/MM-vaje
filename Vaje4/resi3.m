function [x] = resi3(a, b, c, f)
    % re�imo sistem Ax = f, kjer je A tridiagonalna matrika
    % oblike A = diag(a,-1) + diag(b) + diag(c, 1),
    % a, b in c pa vektorji primernih velikosti
    
    n = length(b); % matrika A je n*n
    u = ones(n,1);
    l = zeros(n-1,1);
    
    u(1) = b(1);
    for i = 1:n-1
        l(i) = a(i)/u(i);
        u(i+1) = b(i+1) - l(i)*c(i);
    end
    
    %re�evanje
    y = zeros(n,1);
    y(1) = f(1);
    for i = 2:n
        y(i) = f(i) - l(i-1)*y(i-1);
    end
    
    x = zeros(n, 1);
    x(n) = y(n)/u(n);
    for i = (n-1):-1:1
        x(i) = (y(i) - c(i)*x(i+1))/u(i);
    end
    
end

% Komentarji:
% - izka�e se, da Thomasov algoritem v splo�nem NI STABILEN,
% - v posebnih primerih pa je: �e je A spd ali A diagonalno dominantna,
% - v na�em primeru uporabe bo res slednje.

    