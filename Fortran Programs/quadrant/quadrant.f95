! Program to find the length and angle of a line connecting the given 
! point and the origin in an x-y plane. Also, we will find the 
! quadrant of the point

program quadrant

    implicit none
    real x,y,l,a
    real, parameter :: pi = 4*atan(1.0)  ! 2*asin(1) !2*acos(0)
    character q
    
    print *, "Enter the values of co-ordinates, x and y:"
    read *, x,y
    
    !l = (x**2 + y**2)**0.5
    l = sqrt(x**2+y**2)
    
    print *, " l = ",l
    a = (atan(y/x))*180/pi
    print *, " a = ",a
    
    ! if x+ and y+ then point is in q1
    ! else if x- and y+ then point is in q2
    ! else if x- and y- then point is in q3
    ! else (x+ y-) the point is in q4
    
    if (x >= 0 .and. y >= 0) then
        q = '1'
    else if (x <= 0 .and. y >= 0) then
        q = '2'
    else if (x <= 0 .and. y <= 0) then
        q = '3'
    else
        q = '4'
    end if
    
    print *, "The point is in quadrant:",q

end program quadrant
