! Program to explain Dummy Variables
! Value of a polynomial a0 + a1x + a2x^2 + a3x^3 + .....

program dummy_vars2

    implicit none
    
    real :: x = 10, poly_val
    integer, parameter :: n = 6
    real, dimension(-1:n-2) :: a
    !real, external :: poly ! Not needed
    interface
        real function poly(x,a)
            implicit none
            real, intent(in) :: x
            real, dimension(0:), intent(in) :: a
        end function poly
    end interface
    
    !a = (/5,6,-7,8,9,10,2,3,4,9,1/)
    !a = (/1,2,1/) ! 1 + 2*x + x**2 !value of polynomial at x = 5 is 36
    a(-1:2) = (/1,3,3,1/) ! 1+ 3x + 3x^2 + x**3 ! value at x = 5 is 216
    poly_val = poly(x,a)
    
    print *, "The coefficients of the polynomial are:",a
    print *, "The value of the polynomial at x = ",x," is:",poly_val

end program dummy_vars2

real function poly(x, a)
    
    implicit none
    real, intent(in) :: x
    real, intent(in), dimension(0:) :: a
    integer :: i, n
    n = size(a)
    poly = 0
    print *, "N = ",n
    do i=0,n-1
        poly = poly + a(i)*x**(i) 
    end do
    
end function poly
