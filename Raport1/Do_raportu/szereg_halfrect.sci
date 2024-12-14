function [t,y] = f1_rec()
    t = 0:0.01:%pi
    y = sin(%pi*t)
    y(y<0)=0
endfunction

function y = f2_rec(N)
    t = 0:0.01:%pi
    y = 1/%pi
    for n=1:N
        if modulo(n,2)==0 then
            y = y - (2/%pi)*(cos(t.*n*%pi))./(n**2-1)
        elseif n==1 then
            y = y + (1/2)*sin(%pi.*t)
        else
            y = y + 0
        end
    end
endfunction

function a = a_n(n)
    a = (integrate("sin(%pi*t)*cos(n*t)", "t", 0, 1) + integrate("sin(%pi*t)*cos(n*t)", "t", 2, 3)) / %pi 
endfunction

function b = b_n(n)
    b =(integrate("sin(%pi*t)*sin(n*t)", "t", 0, 1) + integrate("sin(%pi*t)*sin(n*t)", "t", 2, 3)) / %pi  
endfunction

function y = f3_rec(N)
    t = 0:0.01:%pi
    a_0 = (integrate("sin(%pi*t)", "t", 0, 1) + integrate("sin(%pi*t)", "t", 2, 3)) / %pi 
    y = a_0/2
    for n = 1:N
        a = a_n(n)
        b = b_n(n)
        y = y + a*cos(n*t)+b*sin(n*t)
    end
endfunction
[t,y1] = f1_rec()
y2 = f2_rec(1)
y3 = f3_rec(1)
y4 = f2_rec(2)
y5 = f3_rec(2)
y6 = f2_rec(4)
y7 = f3_rec(4)
y8 = f2_rec(8)
y9 = f3_rec(8)

plot(t,y1,t,y2,t,y3)
ax=gca()
ax.data_bounds=[-0.1 -0.1;%pi 1.3]
legend('func_halfrectified', 'analytical_halfrectified','numerical_halfrectified')
xtitle('Halfrectified function for N=1', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres141.png')
clf
plot(t,y1,t,y4,t,y5)
ax=gca()
ax.data_bounds=[-0.1 -0.1;%pi 1.3]
legend('func_trapeze', 'analytical_halfrectified','numerical_halfrectified')
xtitle('Halfrectified function for N=2', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres142.png')
clf
plot(t,y1,t,y6,t,y7)
ax=gca()
ax.data_bounds=[-0.1 -0.1;%pi 1.3]
legend('func_trapeze', 'analytical_halfrectified','numerical_halfrectified')
xtitle('Halfrectified function for N=4', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres144.png')
clf
plot(t,y1,t,y8,t,y9)
ax=gca()
ax.data_bounds=[-0.1 -0.1;%pi 1.3]
legend('func_trapeze', 'analytical_halfrectified','numerical_halfrectified')
xtitle('Halfrectified function for N=8', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres148.png')

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
    y = f2_rec(N(i))
    m_a_e(i) = mae(y1, y)
    r_m_s_e(i) = rmse(y1, y)
end

disp('N values:'), disp(N)
disp('MAE values:'), disp(m_a_e)
disp('RMSE values:'), disp(r_m_s_e)

m_a_e_1 = zeros(1, 4)
r_m_s_e_1 = zeros(1, 4)

for i = 1:length(N)
    y = f3_rec(N(i))
    m_a_e_1(i) = mae(y1, y)
    r_m_s_e_1(i) = rmse(y1, y)
end

disp('N values:'), disp(N)
disp('MAE values:'), disp(m_a_e_1)
disp('RMSE values:'), disp(r_m_s_e_1)
