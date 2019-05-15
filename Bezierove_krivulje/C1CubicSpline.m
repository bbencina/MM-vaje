function z = C1CubicSpline(u, p, v)
    % išèemo C1 kubièen zlepek nad intervalom [u0,uN] z delilnimi
    %toèkami u, ki interpolira toèke p in ima v njih tangentno enako
    % pripradajoèemu v
    z = zeros(2, (size(u,2)-1)*3+1);
    du = u(:,2:end)-u(:,1:end-1);
    
    for i=0:size(p,2)-1
        z(:,3*i+1) = p(:,i+1);
        if i ~= size(p,2)-1
            z(:,3*i+2) = p(:,i+1) + du(i+1)*v(:,i+1)/3;
        end
        if i ~= 0
            z(:,3*i) = p(:,i+1) - du(i)*v(:,i+1)/3;
        end
        
    end
    hold on
    for i = 0:size(u,2)-2
        b = z(:,3*i+1:(3*i+4));
        plotBezier(b, 0);
    end
    hold off
end