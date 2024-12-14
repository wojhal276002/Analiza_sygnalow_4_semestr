x1 = -10:0.01:10
function y  = trojkat(t)
    y = (1-abs(t)).*(abs(t)<=1)
endfunction

function y = sygnal(t)
    y = sin(t/2).**2./(t/2).**2
endfunction
plot(x1,trojkat(x1),x1,sygnal(x1))
