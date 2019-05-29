function [b] = aproksimacija_kroznice(phi, d)
    % za dani kot in d doloèi G1 kubièno aproksimacijo krožnega loka
    % in z njo aproksimiraj celotno krožnico z radijem 1
    
    % Komentarji:
    % - poskrbi, da je pi/phi celo število,
    % - najboljši rezultat pride pri d = 4/3*tan(phi/2).
    
    b0 = [cos(phi); -sin(phi)];
    b3 = [cos(phi); sin(phi)];
    
    t0 = d * [sin(phi); cos(phi)];
    tn = d * [-sin(phi); cos(phi)];
    
    b1 = b0 + t0;
    b2 = b3 - tn;
    
    b = [b0 b1 b2 b3];
    
    % risanje
    figure
    hold on
    axis equal
    t = linspace(0, 2*pi, 100);
    plot(cos(t), sin(t), 'r');
    
    %poskrbimo, da se dovoljkrat rotira (zadnja se dvakrat nariše,
    %da se vedno sklene)
    k = floor(pi / phi);
    
    plotBezier(b, 0);
    for i = 1:k
        %rotacija za 2*phi okrog središèa
        b2 = b;
        rot = [cos(2*phi), -sin(2*phi); sin(2*phi), cos(2*phi)];
        for i = 1:size(b, 2)
            b2(:, i) = rot * (b(:, i));
        end
        b = b2;
        
        plotBezier(b, 0);
    end
    hold off
end