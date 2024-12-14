function zab = fourier(A,t_0,T)
    xs_1 = t_0:0.02:T
    ys_2 = 0:0.02:A
    func = sqrt((xs_1-t_0).**2+(ys_2).**2)
    zab = plot(xs_1, func,T:0.02:T,ys_2)
endfunction

/*fourier(1,0,1)*/


function y = fourier_2(A,T)
    t = 0:0.01:20
    y = A*((t./T)-floor(t./T))
    plot(t,y) 
endfunction

clf
subplot(2,1,1)
fourier_2(2,5)

function y = fourier_apr(A,T,N)
    xs = [-10:0.01:10]
    y = A/2
    for n=1:N
        y = y + (-A/n*%pi)*sin(xs.*((n*2*%pi)/T))
    end
    plot(xs,y)
endfunction

subplot(2,1,2)
fourier_apr(2,5,100)
