! Set of functions for factorial, permutation and combination

recursive integer*8 function fact(n) result(fact1)

    implicit none
    integer*8, intent(in) :: n
    
    if(n == 1 .or. n == 0) then
        fact1 = 1
        return
    else
        fact1 = fact(n-1)
        fact1 = fact1*n
        return
    end if

end function fact

integer*8 function per(n,r)

    implicit none
    integer*8, intent(in) :: n,r
    integer*8, external :: fact
    
    per = fact(n)/fact(n-r)

end function per

integer*8 function comm(n,r)

    implicit none
    integer*8, intent(in) :: n,r
    integer*8, external :: fact
    
    comm = fact(n)/(fact(n-r)*fact(r))

end function comm

integer*8 function com(per,r)

    implicit none
    integer*8, intent(in) :: per,r
    integer*8, external :: fact
    
    com = per/fact(r)

end function com

integer*8 function comb(n,r)

    implicit none
    integer*8, intent(in) :: n,r
    integer*8, external :: fact, per
    
    comb = per(n,r)/fact(r)

end function comb
