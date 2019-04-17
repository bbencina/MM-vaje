function [I] = monte_carlo1(f, a, b, N)
    % izra�una integral od a do b funkcije f
    v = a + (b-a)*rand(1, N);
    I = sum(sum(f(v))) * (b-a) / N;
end