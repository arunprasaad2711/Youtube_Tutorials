! Program to explain Dummy Variables
! Positive Integral Power function
! Value of a polynomial a0 + a1x + a2x^2 + a3x^3 + .....

program dummy_vars

    implicit none
    integer ::  p = 3
    real :: v = 10, pow, poly, power
    
    !real, external :: poly, power
    integer*8 , external :: fact
    
    real :: x = 10, poly_val
    integer, parameter :: n = 3
    real, dimension(0:n) :: a
    
    integer*8 :: f1 = 10, fact1
    
    !a = (/5,6,-7,8,9,10,2,3,4,9,1/)
    !a = (/1,2,1/) ! 1 + 2*x + x**2 !value of polynomial at x = 5 is 36
    a = (/1,3,3,1/) ! 1+ 3x + 3x^2 + x**3 ! value at x = 5 is 216
    pow = power(v,p)
    poly_val = poly(x,a,n)
    fact1 = fact(f1)
    
    print *, "The power ",p," of ",v," is:",pow
    print *, "The coefficients of the polynomial are:",a
    print *, "The value of the polynomial at x = ",x," is:",poly_val
    print *, "The factorial of ",f1, " is:", fact1

end program dummy_vars

integer*8 function fact(n)

    implicit none
    integer*8, intent(in) :: n
    integer*8 :: i
    
    fact = 1
    
    do i=1,n
        fact = fact*i
    end do

end function fact

real function poly(x, a, n)
    
    implicit none
    integer, intent(in) :: n
    real, intent(in) :: x
    real, intent(in), dimension(0:n) :: a
    integer :: i
    poly = 0
    do i=0,n
        poly = poly + a(i)*x**(i) 
    end do
    
end function poly

real function power(x,n)

    implicit none
    integer, intent(in) :: n
    real, intent(in) :: x
    integer :: i
    power = 1.0
    do i=1,n
        power = x*power
    end do

end function power
