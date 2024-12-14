function [t,y] = f1_trap()
    t = -%pi:0.01:%pi
    N = length(t)
    
    y = zeros(1,N)
    
    for i = 1:N
        if t(i) >= -%pi & t(i) <= -%pi+2 then
            y(i) = t(i)+%pi
        elseif t(i) >= %pi-2 & t(i) <= %pi then
            y(i) = %pi-t(i)
        elseif t(i) >= -%pi+2 & t(i) <= %pi-2
            y(i) = 2
        end
    end
endfunction


function y = f2_trap(N)
    t = -%pi:0.01:%pi
    
    y = (4-4/%pi)/2
    
    for n = 1:N
        y = y + ((2*cos((%pi-2)*n)-2*cos(%pi*n)-4*n*sin((%pi-2)*n)-4*n*sin((2-%pi)*n))/(%pi*n**2))*cos(n*t)
    end
endfunction

function a = a_n(n)
    a = (integrate("2*cos(n*t)", "t", -%pi/2, %pi/2)+integrate("(t+%pi)*cos(n*t)", "t", -%pi, -%pi/2) + integrate("(%pi-t)*cos(n*t)", "t", %pi/2, %pi)) / %pi 
endfunction

function b = b_n(n)
    b = (integrate("2*sin(n*t)", "t", -%pi/2, %pi/2)+integrate("(t+%pi)*sin(n*t)", "t", -%pi, -%pi/2) + integrate("(%pi-t)*sin(n*t)", "t", %pi/2, %pi)) / %pi 
endfunction

function y = f3_trap(N)
    t = -%pi:0.01:%pi
    a_0 = (integrate("2", "t", -%pi/2, %pi/2)+integrate("(t+%pi)", "t", -%pi, -%pi/2) + integrate("(%pi-t)", "t", %pi/2, %pi)) / %pi 
    y = a_0/2
    for n = 1:N
        a = a_n(n)
        b = b_n(n)
        y = y + a*cos(n*t)+b*sin(n*t)
    end
endfunction

[t,y1] = f1_trap()
y2 = f2_trap(1)
y3 = f3_trap(1)
y4 = f2_trap(2)
y5 = f3_trap(2)
y6 = f2_trap(4)
y7 = f3_trap(4)
y8 = f2_trap(8)
y9 = f3_trap(8)

plot(t,y1,t,y2,t,y3)
ax=gca()
ax.data_bounds=[-4.7 0;4.7 2.3]
legend('func_trapeze', 'analytical_trapeze','numerical_trapeze')
xtitle('Trapeze function for N=1', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres111.png')
clf
plot(t,y1,t,y4,t,y5)
ax=gca()
ax.data_bounds=[-4.7 0;4.7 2.3]
legend('func_trapeze', 'analytical_trapeze','numerical_trapeze')
xtitle('Trapeze function for N=2', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres112.png')
clf
plot(t,y1,t,y6,t,y7)
ax=gca()
ax.data_bounds=[-4.7 0;4.7 2.3]
legend('func_trapeze', 'analytical_trapeze','numerical_trapeze')
xtitle('Trapeze function for N=4', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres114.png')
clf
plot(t,y1,t,y8,t,y9)
ax=gca()
ax.data_bounds=[-4.7 0;4.7 2.3]
legend('func_trapeze', 'analytical_trapeze','numerical_trapeze')
xtitle('Trapeze function for N=8', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres118.png')

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
    y = f2_trap(N(i))
    m_a_e(i) = mae(y1, y)
    r_m_s_e(i) = rmse(y1, y)
end

disp('N values:'), disp(N)
disp('MAE values:'), disp(m_a_e)
disp('RMSE values:'), disp(r_m_s_e)

m_a_e_1 = zeros(1, 4)
r_m_s_e_1 = zeros(1, 4)

for i = 1:length(N)
    y = f3_trap(N(i))
    m_a_e_1(i) = mae(y1, y)
    r_m_s_e_1(i) = rmse(y1, y)
end

disp('N values:'), disp(N)
disp('MAE values:'), disp(m_a_e_1)
disp('RMSE values:'), disp(r_m_s_e_1)


