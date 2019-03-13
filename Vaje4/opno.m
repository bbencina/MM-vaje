function [r, x] = opno(st_tock, radij, func)
    n = st_tock;
    R = radij; % radij kroga

    h = R/n;

    r = (0:h:R)';

    %diagonala
    b = -2*ones(n,1);
    %poddiagonala
    a = ones(n-1,1);
    for i = 1:n-1
        a(i) = 1 - h/(2*r(i+1));
    end
    %naddiagonala
    c = 2*ones(n-1,1);
    for i = 2:n-1
        c(i) = 1 + h/(r(i)*2);
    end

    f = h^2 .*ones(n, 1);

    x = resi3(a, b, c, f);
    x = [x;0];
 
end