function [] = monty(n)
    % n število ponovitev Monty Hallove igre
    stevec = 0;
    for k=1:n
        avto = randi(3);
        koza = zeros(1, 2); j = 1;
        for i=1:3
            if i == avto
                continue
            end
            koza(j) = i;
            j = j+1;
        end
        izbrana = input('Izberite vrata: ');
        if izbrana == avto
            index = randi(2);
            nini = koza(index);
            fprintf('Za vrati %d ni avtomobila!\n', nini);
            izbrana2 = input('Želite ponovno izbrati: ');
            if izbrana2 == avto
                stevec = stevec + 1;
                disp('Hura, nagrada je vaša!');
            else
                disp('Jbg, naslednjiè.');
            end
        else
            if izbrana == koza(1)
                nini = koza(2);
            else
                nini = koza(1);
            end
            fprintf('Za vrati %d ni avtomobila!\n', nini);
            izbrana2 = input('Želite ponovno izbrati: ');
            if izbrana2 == avto
                stevec = stevec + 1;
                disp('Hura, nagrada je vaša!');
            else
                disp('Jbg, naslednjiè.');
            end
        end
    end
    fprintf('Zadeli ste v %f procentov primerov.\n', stevec*100/n);
end