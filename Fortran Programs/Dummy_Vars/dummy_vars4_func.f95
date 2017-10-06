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
