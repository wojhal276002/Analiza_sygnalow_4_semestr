function y =f_f_t(N,omega)
    xs = 0.001:0.001:0.5
    y = 0
    for n=1:N
        y = y + n.*cos(n*omega.*xs)
    end
endfunction

f_f_t(5,20*%pi)


function X_l =d_f_t(N)
    xs = 0.001:0.001:0.5 
    disp(length(xs))
    x_n = f_f_t(5,20*%pi)
    X_l = zeros(N)
    tic();
    for k=0:N-1
        X = 0
        for n=0:N-1
            X = X + x_n(n+1)*exp((-%i*2*%pi*n*k)/N)
        end
        X_l(k+1)=X
    end
    t = toc();
    disp("dyskretnie",t)
    clf
    subplot(3,1,1)
    plot(xs,x_n)
    subplot(3,1,2)
    plot(0:N-1,real(X_l),0:N-1,imag(X_l))
    ax = gca()
    ax.data_bounds=[0 -200;50 1400]
    subplot(3,1,3)
    tic();
    fft_1 = fft(x_n)
    t1 = toc();
    disp("fft",t1)
    plot(0:N-1,real(fft_1),0:N-1,imag(fft_1))
    ax1 = gca()
    ax1.data_bounds=[0 -200;50 1400]
endfunction

d_f_t(500)
