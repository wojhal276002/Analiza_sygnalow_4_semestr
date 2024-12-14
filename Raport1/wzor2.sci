function y = f2_og()
    N = length(t)
    t = -%pi:0.01:%pi
    
    // Inicjalizacja wektora y
    y = zeros(N);
    
    // Definicja funkcji f(t) w zależności od przedziału
    for i = 1:N
        if t(i) >= -%pi & t(i) <= -%pi+2 then
            y(i) = t(i)+%pi
        elseif t(i) >= %pi-2 & t(i) <= %pi then
            y(i) = %pi-t(i)
        elseif t(i) >= -%pi+2 & t(i) <= %pi-2
            y(i) = 2
        end
    end
    plot(t,y)
    ax = gca()
    ax.data_bounds=[-5 0;5 2.2]
endfunction

f2_og()

function y = f2(N)
    t = -%pi:0.01:%pi
    
    y = (4-4/%pi)/2
    
    for n = 1:N
        y = y + ((2*cos((%pi-2)*n)-2*cos(%pi*n)-4*n*sin((%pi-2)*n)-4*n*sin((2-%pi)*n))/(%pi*n**2))*cos(n*t)
    end
    plot(t,y)
endfunction

f2(8)
