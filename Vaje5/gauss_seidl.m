function [rez] = gauss_seidl(U, tol, a)
    n = size(U, 1) -2;
    x = linspace(-a, a, n+2); y = x;
    [X, Y] = meshgrid(x, y);
    while 1
        napaka = -Inf;
        for i = 2:n+1
            for j = 2:n+1
                temp = U(i, j);
                U(i, j) = (U(i+1,j)+U(i-1,j)+U(i,j+1)+U(i,j-1))/4;
                if abs(temp-U(i,j)) > napaka
                    napaka = abs(temp-U(i,j));
                end
            end
        end
        g = surf(X, Y, U);
        pause(0.001);
        delete(g);
        if napaka < tol
            rez = U;
            break;
        end
    end
    g = surf(X, Y, U);
end