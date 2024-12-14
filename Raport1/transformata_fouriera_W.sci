function y = fourier()
    t = -%pi:0.01:%pi
    N = length(t)
    
    y = zeros(1,N);
    
    for i = 1:N
        if t(i) >= -%pi & t(i) <= -%pi/2  then
            y(i) = -t(i)
        elseif t(i) >= -%pi/2 & t(i) <= 0 then
            y(i) = t(i)+%pi
        elseif t(i) >= 0 & t(i) <= %pi/2 then
            y(i) = %pi-t(i)
        elseif t(i) >= %pi/2 & t(i) <= %pi then
            y(i) = t(i)
        end
    end
    disp(y)
    plot(t,y)
endfunction

fourier()

function y = f2(N)
    t = -%pi:0.01:%pi
    
    y = (3*%pi)/4
    
    for n = 1:N
        y = y + ((2-4*cos(%pi*n/2)+2*cos(%pi*n)+2*%pi*n*sin(%pi*n))/(%pi*n**2))*cos(n*t)
    end
    plot(t,y)
    disp(y)
endfunction

f2(8)
