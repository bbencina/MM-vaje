function [A] = diagonale(n)
    % Funkcija diagonale sestavi matriko, ki ima na diagonali
    % št od 1 do n, v zg. trikotniku sam 4, prva poddiagonala naj
    % bodo same 1, druga pa same -1.
    
    A = diag(1:n) + triu(4.*ones(n)) - 4.*eye(n) + diag(ones(n-1,1), -1) + diag(-1.*ones(n-2, 1), -2);
end