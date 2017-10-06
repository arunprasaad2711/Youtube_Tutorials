! Program to demonstrate some special statements in fortran

program special_kind

    implicit none
    integer, parameter :: real_8_32 = selected_real_kind(p=33,r=32) & 
    & , int_10 = selected_int_kind(10)
    
    ! Intrinsic function to set the minimum precision and range
    ! Here, you have a minimum precision of 'p' decimal places
    ! and a mimimum range of +- 'r' eg: 8 decimal places and +- 10**32
    ! Values adjusted to definitions available
    
    real (kind = real_8_32) :: a = 2.52415235e10
    double precision :: b = 2.5d0 ! real(kind=8)
    integer (kind = int_10) :: val1 = 1000
    
    print *,"real_8_32:",real_8_32
    print *,"int_10:",int_10
    
    print *, "Precision of a is:",precision(a)
    print *, "Kind of a is:",kind(a)
    
    print *, "Precision of b is:",precision(b)
    print *, "Kind of b is:",kind(b)
    
    print *, "Kind of val is:",kind(val1)

end program special_kind
