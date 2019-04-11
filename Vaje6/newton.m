function y = newton(F, JF, x0, tol)
    napaka = Inf;
    
    while napaka > tol
        dx = -JF(x0)\F(x0);
        xn = x0 + dx;
        napaka = max(abs(xn-x0));
        x0 = xn;
    end
    y = x0;
end