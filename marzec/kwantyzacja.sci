function [Fx,x]=gamma_discv(x1,x2,k,theta,n)
  > x = linspace(x1,x2,n)
  > Fx = 1/(gamma(k)*theta^k).*x.^(k-1).*exp(-x/theta);
> endfunction
plot(linspace(0,10,100),gamma_discv(0,10,5,1,100),linspace(0,10,10),gamma_discv(0,10,5,1,10))
