function bz =  zrcali_bezier(b)
% ZRCALI_BEZIER prezrcali Bezierovo krivuljo, podano s kontrolnimi
% tockami b, preko premice p, dolocene z zacetno in koncno kontrolno tocko.
% Izrise tudi zacetno in prezrcaljeno krivuljo ter oba kontrolna poligona.
    % smerni vektor premice od b0 do bn
    s = b(:,end)-b(:,1);
    % normala na premico
    n = [0, -1; 1, 0]*s;
    n = n/norm(n);
    
    bz = b;
    for i = 2:size(b,2)-1
        bz(:,i) = b(:,i) - 2*dot(n, b(:,i))*n;
    end
    
    hold on
    axis equal
    
    plotBezier(b, 0);
    plotBezier(bz, 0);
    
    hold off
end