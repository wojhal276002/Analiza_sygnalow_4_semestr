function y = prostokatny(t)
    y = (t>0)+(t<1)-1
endfunction

x1 = -10:0.01:10
y1 = prostokatny(x1)
plot(x1,y1)
function y = sygnal(t,T)
    y = sin(t.*2*%pi*T)./(t.*%pi)
    plot(t,y)
endfunction
sygnal(x1,01)

function re = rea1(t)
    re = (1./(2*%pi.*t)).*sin(2*%pi.*t)
endfunction

function im = ima9(t)
    im = -1./(2*%pi.*t)+1./(2*%pi.*t).*cos(2*%pi.*t)
endfunction


