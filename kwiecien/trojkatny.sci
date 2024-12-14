function x =trojkatny(t)
    x = (1-abs(t)).*(abs(t)<=1)
endfunction

t = -1:0.01:1
x = trojkatny(t)
plot(t,x)
