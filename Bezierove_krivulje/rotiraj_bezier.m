function b2 = rotiraj_bezier(b,phi)
% ROTIRAJ_BEZIER rotira Bezierovo krivuljo, podano s kontrolnimi
% tockami b, za kot phi okrog prve kontrolne tocke. Izrise tudi
% zacetno in rotirano krivuljo ter oba kontrolna poligona.
    b2 = b;
    rot = [cos(phi), -sin(phi); sin(phi), cos(phi)];
    for i = 2:size(b, 2)
        b2(:, i) = b(:, 1) + rot * (b(:, i)-b(:, 1));
    end
    axis equal
    plotBezier(b, 0);
    plotBezier(b2, 0);
end