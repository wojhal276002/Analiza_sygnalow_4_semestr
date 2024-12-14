function skunks=skunks1(n,k)
    if n==k then
        skunks=1
    elseif k==0 then
        skunks=0
    else
        skunks=(n-1)*skunks1(n-1,k)+skunks1(n-1,k-1)
    end
endfunction

skunks1(5,2)
