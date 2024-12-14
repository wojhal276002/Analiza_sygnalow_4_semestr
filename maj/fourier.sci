function zab = fourier(A,t_0,T)
    xs_1 = t_0:0.02:T
    func = abs(sin(xs_1))
    zab = plot(xs_1, func)
endfunction

clf
subplot(3,1,1)
fourier(1,0,1)



function y = fourier_2(A,T)
    t = 0:0.01:20
    y = A*((t./T)-floor(t./T))
    plot(t,y) 
endfunction

subplot(3,1,2)
fourier_2(2,5)

function y = fourier_apr(A,T,N)
    xs = [-10:0.01:10]
    y = A/2
    for n=1:N
        y = y + (-A/n*%pi)*sin(xs.*((n*2*%pi)/T))
    end
    plot(xs,y)
endfunction

subplot(3,1,3)
fourier_apr(2,5,2)
