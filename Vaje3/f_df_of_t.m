function [F, DF] = f_df_of_t(t)
    % funkcija pri doloèenem t vrne vrednost in odvod
    
    g = 9.8; l = 10;
    
    delitev = linspace(0, t, 200);
    f = @(t, y) [y(2) ; -g/l*sin(y(1))];
    zac = [3*pi/4 , 0];
    [t, res] = ode45(f, delitev, zac);
    F = res(end, 1);
    DF = res(end, 2);
end