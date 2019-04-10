function [theta, k] = isci_theta(T2)
    % funkcija vrne theta, ki bo re�itev spodnje ena�be
    % privzetek: T1 = [0, 0]
    
    b = T2(1); B = T2(2);
    f = @(x) 1 - cos(x) + (B/b)*(x - sin(x));
    theta = fzero(f, 1);
    
    % vrnimo �e k
    
    k = sqrt(2*b/(theta - sin(theta)));
    
end