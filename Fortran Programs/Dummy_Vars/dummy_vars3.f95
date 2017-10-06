! Program to explain Dummy Variables
! Value of a polynomial a0 + a1x + a2x^2 + a3x^3 + .....

module poly_val_dat

    implicit none
    save
    integer, parameter :: nmax = 20
    real, dimension(0:nmax) :: a

end module poly_val_dat

program dummy_vars3

    use poly_val_dat
    implicit none  
    real :: x = 10, poly_val, poly
    integer, parameter :: n = 4
    !real, dimension(-1:n-2) :: a
    !a = (/5,6,-7,8,9,10,2,3,4,9,1/)
    !a = (/1,2,1/) ! 1 + 2*x + x**2 !value of polynomial at x = 5 is 36
    a(0:n-1) = (/1,3,3,1/) ! 1+ 3x + 3x^2 + x**3 ! value at x = 5 is 216
    poly_val = poly(x,n)
    
    print *, "The coefficients of the polynomial are:",a
    print *, "The value of the polynomial at x = ",x," is:",poly_val

end program dummy_vars3

real function poly(x, n)
    
    use poly_val_dat
    implicit none
    real, intent(in) :: x
    integer, intent(in) :: n
    integer :: i
    poly = 0
    print *, "N = ",n
    do i=0,n-1
        poly = poly + a(i)*x**(i) 
    end do
    
end function poly
