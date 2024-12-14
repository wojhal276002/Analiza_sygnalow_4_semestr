function y = gaussowski()
    t = -3:0.01:3
    y = %e**(-t.**2)
endfunction


function y = transformata3()
    t = -3:0.01:3
    y = sqrt(%pi)*%e**(t.**2 /-4)
endfunction

t = -3:0.01:3

plot(t, gaussowski(), 'r', t, transformata3(), 'g')
legend('impuls', 'transformata',);
xtitle('Porównanie impulsu gaussowskiego i jego transformaty', 't', 'f(t)');
xs2png(0, 'C:\Users\zawer\Documents\scilab\raport1\wykres2_3.png');
