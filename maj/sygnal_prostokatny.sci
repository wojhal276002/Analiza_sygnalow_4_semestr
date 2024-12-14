function y = prostokatny(t)
    y = (t>0)+(t<1)-1
endfunction

x1 = -10:0.01:10
y1 = prostokatny(x1)
plot(x1,y1)
function y = sygnal(t,T)
    y = T*sin(t.*2*%pi/2*T)./(t.*%pi)
    plot(t,y)
endfunction
sygnal(x1,1)

