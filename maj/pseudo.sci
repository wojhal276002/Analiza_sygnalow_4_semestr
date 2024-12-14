function y = rand_un()
    y = gsort(rand(1,10000,"u"))
    disp(y)
    histplot(50,y)
endfunction

function y = rand_nor()
    y = gsort(rand(1,10000,"normal"))
    histplot(50,y)
endfunction

/*clf
subplot(2,1,1)
rand_un()
subplot(2,1,2)
rand_nor()*/

function [y,y1] =f_f_t(N,omega)
    xs = 0.001:0.001:0.5
    X = rand(1,500,"n")
    y = 0
    y1 = 0
    for n=1:N
        y = y + n.*cos(n*omega.*xs)
        y1 = y1 + n.*cos(n*omega.*xs) + 10*X
    end
endfunction

function [X_l,X_l1] =d_f_t(N)
    xs = 0.001:0.001:0.5 
    [x_n,x_n1] = f_f_t(5,20*%pi)
    X_l = zeros(N)
    X_l1 = zeros(N)
    for k=0:N-1
        X = 0
        X1 = 0
        for n=0:N-1
            X = X + x_n(n+1)*exp((-%i*2*%pi*n*k)/N)
            X1 = X1 + x_n1(n+1)*exp((-%i*2*%pi*n*k)/N)
        end
        X_l(k+1)=X
        X_l1(k+1)=X1
    end
    clf
    subplot(4,1,1)
    plot(xs,x_n)
    subplot(4,1,2)
    plot(xs,x_n1)
    subplot(4,1,3)
    plot(0:N-1,real(X_l),0:N-1,imag(X_l))
    ax = gca()
    ax.data_bounds=[0 -200;50 1400]
    subplot(4,1,4)
    plot(0:N-1,real(X_l1),0:N-1,imag(X_l1))
    ax1 = gca()
    ax1.data_bounds=[0 -200;50 1400]
endfunction

d_f_t(500)
