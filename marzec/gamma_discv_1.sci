function [Fx,x,Fy]=gamma_discv_2(x1,x2,k,theta,n,n2)
     x = linspace(x1,x2,n)
     Fx = 1/(gamma(k)*theta^k).*x.^(k-1).*exp(-x/theta);
     y = linspace(min(Fx),max(Fx),n2)
     Fy = zeros(1,n)
     mid = (y(2) -y(1))/2
     for i = 1:n
         j = sum(Fx(i)> y+mid)
         Fy(i) = y(j+1)
     end
endfunction

[Fx,x,Fy] = gamma_discv_2(0,10,5,1,10,10)
plot(x,Fx,x,Fy)
