function [der] = bezier_der(b, t)
%     [k1, k2] = sub_demo(b, t, 0);
%     der = (size(b,2)-1)*(k2(:,2)-k1(:,end-1));
    
    %drug naèin
    db = b(:,2:end) - b(:,1:end-1);
    der = (size(b, 2)-1)*deCasteljau(db, t);
end