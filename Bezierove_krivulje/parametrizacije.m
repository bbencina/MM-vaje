p = [1,  2, 3, 4,  2;
     1, -2, 4, 6, -5];

v = [1,  1,  1,  1, -1;
     1, -1, -3, -1,  1];
 
 u0 = 0;
 N = 5;
 
 for alpha = [0, 0.5, 1]
     u = zeros(1,5);
     for i = 2:N
         u(i) = u(i-1) + (norm(p(:,i)-p(:,i-1)))^alpha;
     end
     figure
     C1CubicSpline(u, p, v)
 end
