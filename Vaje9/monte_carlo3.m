function [I] = monte_carlo3(f, a1, b1, a2, b2, a3, b3, N)
    v1 = a1 + (b1-a1)*rand(1,N);
    v2 = a2 + (b2-a2)*rand(1,N);
    v3 = a3 + (b3-a3)*rand(1,N);
    I = sum(f(v1, v2, v3)) * (b1-a1)*(b2-a2)*(b3-a3) / N;
end