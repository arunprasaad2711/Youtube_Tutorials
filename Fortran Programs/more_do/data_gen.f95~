! Program to generate data using a function

program gen_dat

    implicit none
    real, parameter :: pi = 4*atan(1.0)
    real :: a, b, dx, c
    real , external :: func
    integer :: i, n
    real, allocatable, dimension(:) :: x, y
    
    print *, "Enter the limits a and b:"
    read *, a,b
    print *, "Enter the number of points:"
    read *, n
    print *, "Enter a slope:"
    read *, c
    
    dx = (b-a)/real(n-1)
    allocate(x(n), y(n))
    
    x(1:n) = [(a+dx*(i-1), i=1,n)]
    y(1:n) = [(func(x(i),c), i=1,n)]
    
    open(unit = 10, file = "func_dat.txt")
    10 format(f10.5, 5x, f10.5)
    do i = 1,n
        write(unit=10,fmt=10), x(i), y(i)
    end do
    close(unit=10)
    
    print *, "All done!"

end program gen_dat
