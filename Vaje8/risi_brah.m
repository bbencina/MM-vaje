function [theta, k] = risi_brah(T1, T2)
    % nariše poljubno brahistihrono
    
    a = T1(1); A = T1(2);
    b = T2(1); B = T2(2);
    
    %premaknemo toèke dol, da isci_theta naredi svoje
    bt = b-a; Bt = B-A;
    [theta, k] = isci_theta([bt Bt]);
    
    t = linspace(0, theta, 100);
    % premaknemo brahistohrono nazaj gor
    x = @(t) 0.5 * k^2 * (t - sin(t)) + a;
    y = @(t) -0.5 * k^2 * (1 - cos(t)) + A;
    plot(x(t), y(t));
    grid on
    axis equal
end