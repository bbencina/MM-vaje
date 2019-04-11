function [] = risi_ver(zac, L, M)
    
    W0 = [-1; 1]; % zaè približek
    
    X = ver_uv(W0, zac, L, M);
    
    hold on
    plot(X(1,:), X(2,:));
    plot(X(1,:),X(2,:),'o','MarkerSize', 5,'LineWidth', 5);
    hold off
    
    grid on
    axis([zac(1,1), zac(1,2), ceil(min(X(2,:))-1), max(zac(2,1),zac(2,2))]);
end