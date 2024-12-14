function y = fourier_2(A,T,D)
     t = 0:0.01:20
     y = A*(abs(modulo(t,T))<D*T)
    plot(t,y,'.')
endfunction

function y = fourier_apr(A,T,D,N)
    xs = 0:0.01:10
    y = A*D
    for n=1:N
        y = y + (A*sin(n*2*%pi*D)/%pi*n)*cos(xs.*((n*2*%pi)/T))+(2*A*sin(n*%pi*D)*sin(n*%pi*D))*sin(xs.*((n*2*%pi)/T))
    end
    plot(xs,y)
endfunction

fourier_apr(2,3,2/3,10)

