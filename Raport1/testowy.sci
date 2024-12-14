function x =trojkatny(t)
    x = (t-abs(t)).*(abs(t)<=t)
endfunction

t = -%pi:0.01:%pi
x = trojkatny(t)
plot(t,x)
