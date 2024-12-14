function [t,y] = f1_kor()
    t = -%pi:0.01:%pi
    N = length(t)
    
    y = zeros(1,N)
    
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
endfunction



function y = f2_kor(N)
    t = -%pi:0.01:%pi
    
    y = (3*%pi)/4
    
    for n = 1:N
        y = y + ((2-4*cos(%pi*n/2)+2*cos(%pi*n)+2*%pi*n*sin(%pi*n))/(%pi*n**2))*cos(n*t)
    end
endfunction

function a = a_n(n)
    a = (integrate("-t*cos(n*t)", "t", -%pi, -%pi/2)+integrate("(t+%pi)*cos(n*t)", "t", -%pi/2, 0) + integrate("(%pi-t)*cos(n*t)", "t", 0, %pi/2)+ integrate("t*cos(n*t)", "t", %pi/2, %pi)) / %pi 
endfunction

function b = b_n(n)
    b = (integrate("-t*sin(n*t)", "t", -%pi, -%pi/2)+integrate("(t+%pi)*sin(n*t)", "t", -%pi/2, 0) + integrate("(%pi-t)*sin(n*t)", "t", 0, %pi/2)+ integrate("t*sin(n*t)", "t", %pi/2, %pi)) / %pi 
endfunction

function y = f3_kor(N)
    t = -%pi:0.01:%pi
    a_0 = (integrate("-t", "t", -%pi, -%pi/2)+integrate("t+%pi", "t", -%pi/2, 0) + integrate("%pi-t", "t", 0, %pi/2)+ integrate("t", "t", %pi/2, %pi)) / %pi 
    y = a_0/2
    for n = 1:N
        a = a_n(n)
        b = b_n(n)
        y = y + a*cos(n*t)+b*sin(n*t)
    end
endfunction

[t,y1] = f1_kor()
y2 = f2_kor(1)
y3 = f3_kor(1)
y4 = f2_kor(2)
y5 = f3_kor(2)
y6 = f2_kor(4)
y7 = f3_kor(4)
y8 = f2_kor(8)
y9 = f3_kor(8)

plot(t,y1,t,y2,"go",t,y3,"r")
ax=gca()
ax.data_bounds=[-4 1.4;4 %pi+1]
legend('func_crown', 'analytical_crown','numerical_crown')
xtitle('Crown function for N=1', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres131.png')
clf
plot(t,y1,t,y4,"go",t,y5,"r")
ax=gca()
ax.data_bounds=[-4 1.4;4 %pi+1]
legend('func_crown', 'analytical_crown','numerical_crown')
xtitle('Crown function for N=2', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres132.png')
clf
plot(t,y1,t,y6,"go",t,y7,"r")
ax=gca()
ax.data_bounds=[-4 1.4;4 %pi+1]
legend('func_crown', 'analytical_crown','numerical_crown')
xtitle('Crown function for N=4', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres134.png')
clf
plot(t,y1,t,y8,"go",t,y9,"r")
ax=gca()
ax.data_bounds=[-4 1.4;4 %pi+1]
legend('func_crown', 'analytical_crown','numerical_crown')
xtitle('Crown function for N=8', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres138.png')

N = [1, 2, 4, 8]

m_a_e = zeros(1, 4)
r_m_s_e = zeros(1, 4)

function val = mae(f1,f2)
    val = mean(abs(f1 - f2));
endfunction


function val = rmse(f1, f2)
    val = sqrt(mean((f1 - f2).**2));
endfunction

for i = 1:length(N)
    y = f2_kor(N(i))
    m_a_e(i) = mae(y1, y)
    r_m_s_e(i) = rmse(y1, y)
end

disp('N values:'), disp(N)
disp('MAE values:'), disp(m_a_e)
disp('RMSE values:'), disp(r_m_s_e)

m_a_e_1 = zeros(1, 4)
r_m_s_e_1 = zeros(1, 4)

for i = 1:length(N)
    y = f3_kor(N(i))
    m_a_e_1(i) = mae(y1, y)
    r_m_s_e_1(i) = rmse(y1, y)
end

disp('N values:'), disp(N)
disp('MAE values:'), disp(m_a_e_1)
disp('RMSE values:'), disp(r_m_s_e_1)
