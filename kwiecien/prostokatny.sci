function y = prostokatny(t)
    y = (abs(t)<0.5)+(abs(t)==0.5)
endfunction

x1 = -1:0.01:1
y1 = prostokatny(x1)

function x =trojkatny(t)
    x = (1-abs(t)).*(abs(t)<=1)
endfunction

t2 = -1:0.01:1
x2 = trojkatny(t2)


function y = kosinusoidalny(t)
    T = 5
    omega = 2*%pi/T
    y = cos(omega*t).*(abs(2*t/T)<=0.5)
endfunction

t3 = -1:0.01:1
y3 = kosinusoidalny(t3)

function y = wykladniczy(t)
    T = 5
    alfa = 1
    y = exp(-alfa.*t).*(abs(t-T/2)*1/T<=0.5)
endfunction

t4 = -1:0.01:1
y4 = wykladniczy(t4)

function x = wykladniczy_malejacy(t)
    A = 1
    alfa = 1
    x = A*exp(-alfa*t).*(t>=0)
endfunction

t5 = -2:0.01:2
x5 = wykladniczy_malejacy(t5)

function x = gausowski(t)
    x = exp(-%pi*t.**2)
endfunction

t7 = -1:0.01:1
x7 = gausowski(t7)

function y = wykladniczy_narastajacy(t)
    alfa = 1
    y = (1-exp(-alfa*t)).*(t>=0)
endfunction

t8 = 0:0.01:5
y8 = wykladniczy_narastajacy(t8)

function y = signum(t)
    y = (t>0)-(t<0)
endfunction

t9 = -2:0.01:2
y9 = signum(t9)
plot(t9,y9)
