function [Fx,x]=gamma_discv(x1,x2,k,theta,n)
    x=linspace(x1,x2,n)
    Fx = 1/(gamma(k)*theta^k).*x.^(k-1).*exp(-x/theta);
endfunction

[Fx,x]=gamma_discv(0,10,5,1,100)
[Fy,y]=gamma_discv(0,10,5,1,10)
yp = interpln([y;Fy],x)
for i = 1:100
    m_a_e = (1/100)*sum(abs(Fy[i]-yp[i]))
end
plot(x,yp)
