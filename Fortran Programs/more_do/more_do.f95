! Sample square

program more_do

    implicit none
    real :: func, a, b, dx, x, y
    real, parameter :: pi = 4*atan(1.0)
    !integer :: i, n
    !real, allocatable, dimension(:) :: x1, y1
    
    !print *, "Enter the number of divisions:"
    !read *, n
    
    a = 0
    !b = 2*pi
    !dx = (b-a)/real(n)
    
    !allocate(x1(0:n), y1(0:n))
    
    !x1(0:n) = [(a+dx*i, i=0,n)]
    
    func(x) = x*x 
    
    !print *, "Func of X = 3.0 and Y = 4.0 is: ", func(3.0,4.0)

end program more_do
