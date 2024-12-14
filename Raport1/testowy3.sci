x = -10:0.01:10

function y = double_exp(a,t)
    y = exp(-a*abs(t))
endfunction
function y = sygnal(a,t)
    y = (2*a)./(a**2+t.**2)
endfunction
plot(x,double_exp(2,x),x,sygnal(2,x))
