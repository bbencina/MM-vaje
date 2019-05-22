function y = kviz_pomozna(b, t)
    %vrne drugo komponento odvoda
    
    der = bezier_der(b, t);
    y = der(2);
end