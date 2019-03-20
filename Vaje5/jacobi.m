function [pomozna] = jacobi(U, tol, a)
    n = size(U, 1) -2;
    pomozna = zeros(n);
    x = linspace(-a, a, n+2); y = x;
    [X, Y] = meshgrid(x, y);
    while 1
        for i = 2:n+1
            for j = 2:n+1
                pomozna(i-1, j-1) = (U(i+1,j)+U(i-1,j)+U(i,j+1)+U(i,j-1))/4;
            end
        end
        g = surf(X, Y, flipud(U));
        pause(0.001);
        delete(g);
        if max(max(abs(U(2:n+1,2:n+1) - pomozna))) < tol
            U(2:n+1, 2:n+1) = pomozna;
            break;
        end
        U(2:n+1, 2:n+1) = pomozna;
    end
    g = surf(X, Y, flipud(U));
end