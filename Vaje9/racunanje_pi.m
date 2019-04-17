function [p] = racunanje_pi(N)
    stevec = 0;
    for i=1:N
        X = [rand(), rand()];
        d2 = X(1)^2 + X(2)^2;
        if d2 <= 1
            stevec = stevec + 1;
        end
    end
    p = 4 * stevec / N;
end