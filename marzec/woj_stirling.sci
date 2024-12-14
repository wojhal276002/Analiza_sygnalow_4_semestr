function stirling=woj_stirling(n,k)
    stirling = (n-1)*woj_stirling(n-1,k)+woj_stirling(n-1,k-1)
endfunction
woj_stirling(1,1)
