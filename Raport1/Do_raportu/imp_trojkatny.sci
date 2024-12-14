x1 = -10:0.01:10
function y  = trojkat(t)
    y = (1-abs(t)).*(abs(t)<=1)
endfunction

function y = sygnal(t)
    y = sin(t/2).**2./(t/2).**2
endfunction
plot(x1,trojkat(x1),x1,sygnal(x1))
legend('imp_triangle', 'transform_triangle')
xtitle('Triangle impulse with Fourier transform', 't', 'x(t)')
xs2png(0, '/Users/wojtek/Desktop/sygnały/wykres211.png')
