x = -10:0.01:10

function y = next(a,t)
    y = exp(-1*a*abs(t))
    plot(t,y)
endfunction
next(%pi,x)
function y = sygnal(a,t,T)
    y = 2*a./(a**2+(T**2/(4*%pi**2.*t.**2)))
    plot(t,y,'.')
endfunction
sygnal(%pi,x,1)
