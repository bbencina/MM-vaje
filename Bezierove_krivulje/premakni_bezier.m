function b2 = premakni_bezier(b,s)
% PREMAKNI_BEZIER translira Bezierovo krivuljo, podano s kontrolnimi
% tockami b, za vektor s. Izrise tudi zacetno in translirano krivuljo
% ter oba kontrolna poligona.
    b2 = b;
    for i = 1:size(b, 2)
        b2(:, i) = b(:, i) + s;
    end
    plotBezier(b, 0);
    plotBezier(b2, 0);
end