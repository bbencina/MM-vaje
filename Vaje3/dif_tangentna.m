function [nicla] = dif_tangentna(t0, tol, N)
    % tangentna metoda, ki izraèuna nièlo sistema z zaè. prb.
    
    t1 = 0; t2 = t0;
    k = 0;
    while 1
        [f, df] = f_df_of_t(t2);
        t1 = t2;
        t2 = t2 - f/df;
        k = k+1;
        if k >= N || abs(t1 - t2) < tol
            break
        end
    end
    nicla = t2;
end