!$ /usr/bin/gfortran

! Program to verify trigonometric identities
! sin^2(x) + cos^2(x) = 1
! sec^2(x) - tan^2(x) = 1
! csc^2(x) - cot^2(x) = 1

program trigs

    implicit none
    integer :: i
    integer, parameter :: n = 100
    real(kind=8) , dimension(0:n) :: x, sinx, cosx, secx, tanx, cscx &
    , cotx, sin2x, cos2x, tan2x, sec2x, csc2x, cot2x
    real, parameter :: pi = 2*asin(1.0)
    real :: increment
    
    increment = 2*pi/(real(n))
    
    !do i=0,n
    !    x(i) = i*increment
        !sinx(i) = sin(x(i)) ! poor implementation
    !end do
    
    x(0:n) = [(i*increment, i=0,n)]
    
    sinx = sin(x)
    cosx = cos(x)
    !tanx = tan(x) ! Also valid
    tanx = sinx/cosx
    cscx = 1.0/sinx
    secx = 1.0/cosx
    cotx = 1.0/tanx
    sin2x = sinx**2
    cos2x = cosx**2
    tan2x = tanx**2
    csc2x = cscx**2
    sec2x = secx**2
    cot2x = cotx**2
    
    !15 format("The Sine of ", f10.4, " degrees is: ", f10.4)
    !20 format("The Sine square of ", f10.4, " degrees is: ", f10.4)
    !10 format(f10.4, 5x , f10.4, 5x, f10.4)
    !5 format(f10.4, 5x, f10.4)
    
    !open(unit=1,file="sinx.txt")
    
    25 format("The Value of sin^2(x) + cos^2(x) at ", f10.4, " degrees is: ", &
    f10.4)
    35 format("The Value of sec^2(x) - tan^2(x) at ", f10.4, " degrees is: ", &
    f10.4)
    45 format("The Value of csc^2(x) - cot^2(x) at ", f10.4, " degrees is: ", &
    f10.4)
    
    do i=0,n
    
        !print 15, (x(i)/pi)*180, sinx(i)
        !print 20, (x(i)/pi)*180, sin2x(i)
        !write(unit=1,fmt=10),(x(i)/pi)*180, sinx(i), sin2x(i)
        !write(unit=1,fmt=5),(x(i)/pi)*180, sin2x(i)
        
        !print 25, (x(i)/pi)*180, sin2x(i) + cos2x(i)
        !print 35, (x(i)/pi)*180, sec2x(i) - tan2x(i)
        print 45, (x(i)/pi)*180, csc2x(i) - cot2x(i)
        
    end do
    !close(unit=1)

end program trigs
