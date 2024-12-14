x = -3:0.01:3

function y = gauss(a,t)
    y = exp(-1*a.*t.**2)
endfunction
function y = sygnal(a,t)
    y = sqrt(%pi/a)*exp(t.**2/-4*a)
endfunction
plot(x,gauss(%pi,x),x,sygnal(%pi,x))



