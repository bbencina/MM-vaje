function [] = cvet(a, b, n)
    % funkcija elipso s središèem v (0, 0) in polosema a in b nariše
    % n-krat, vsakiè zarotirano za kot 2*pi/n, na isto sliko
    
    f1 = @(t) a.*cos(t);
    f2 = @(t) b.*sin(t);
    
    figure
    hold on
    for i = 1:n
        rot = [cos(2*pi*i/n), sin(2*pi*i/n); -sin(2*pi*i/n), cos(2*pi*i/n)];
        kord = zeros(2,200);
        stevec = 1;
        for t = linspace(0, 2*pi, 200)
            kord(1:2,stevec) = rot * [f1(t) ; f2(t)];
            stevec = stevec + 1;
        end
        plot(kord(1,:), kord(2,:));
    end
    hold off
    % za DN poskusi samo z enim for-om vektorsko
end

