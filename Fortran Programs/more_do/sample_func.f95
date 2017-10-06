! sample functions

program sam_func

    implicit none
    real :: func, x, y
    real, parameter :: pi = 4*atan(1.0)
    integer :: i = 4
    
    !read *, i
    func(x,y) = i*x*y*pi
    
    print *, "The product of x*y with x = y = 2 is: ", func(2.0,2.0)
    
    !For this type of function to work:
    ! 1. No extra assignments of any variable
    ! 2. All variables used, must be linked to function
    ! 3. 

end program sam_func
