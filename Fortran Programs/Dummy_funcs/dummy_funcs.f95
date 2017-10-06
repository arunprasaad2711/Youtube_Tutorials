! Program to Pass functions as Dummy Arguments

program dummy_funcs

    implicit none
    integer*8, parameter :: n = 5, r = 3
    integer*8 :: per, com
    !integer*8 :: fact
    integer*8, external :: fact
    real :: sine
    !real, external :: sine
    real :: x = 1.0
    real :: y1, y2
    !real, intrinsic :: cos
    !real, intrinsic :: sin
    
    y1 = sin(x)
    y2 = sine(x,sin)
    
    call percom(per, com, fact, n, r)
    
    print *, "The permutation of ",r," in ",n," is:",per
    print *, "The permutation of ",r," in ",n," is:",com
    print *, "The sine of ",x," using sin() is:",y1
    print *, "The cosine of ",x," using sine is:",y2

end program dummy_funcs

integer*8 function fact(n)

    implicit none
    integer*8, intent(in) :: n
    integer*8 :: i
    fact = 1
    
    if (n<=1) then
        fact = 1
    else
        do i=2,n
            fact = fact*i
        end do
    end if

end function fact

real function sine(x, f)

    implicit none
    real, intent(in) :: x
    real, external  :: f
    
    print *, "Inside the function, x = ", x
    
    sine = f(x)

end function sine

subroutine percom(per, com, fact1, n, r)

    implicit none
    integer*8, intent(in) :: n, r
    integer*8, intent(out) :: per, com
    integer*8, external :: fact1
    
    per = fact1(n)/fact1(n-r)
    com = per/fact1(r)

end subroutine percom
