! Program to find the quadrant, distance and angle of a point in an xy plane from the origin

program quadrant

    implicit none
    !integer :: ai
    real(kind=4) :: x , y !,arr ! these are single precision floating numbers. have 7-8 precise decimal places
    real(kind=8) :: ar, r, ad ! double precision floating numbers and have 15-16 precise decimal places
    real, parameter :: pi = 3.14159265358979323846
    character :: q

    print *, "Enter the x and y co-ordinates"
    read *, x,y

    !pi = 4 ! Will not work

    !x = 4 ! allowed
    !x = 4E1 ! exponent scientific notation
    !y = 4d1 ! similar, double precision

    r = (x**2 + y**2)**0.5
    ar = atan2(y,x) ! an angle between -90 to +90
    ad = (ar / pi) * 180
    !ai = int(ad)
    !arr = real(ai)
    ! atan takes ratio alone and gives angle in radians
    ! atan2 takes, y and x, calculates ratio and gives angle in radians
    ! atand same as atan, but angle in degrees
    ! atan2d same as atan2 but angle in degrees

    ! intrinsic functions : inbuilt functions in fortran
    ! abs -> the absolute value of a variable
    ! trigonometric functions, inverse hyperbolic trig functions
    ! inverse trigonometric functions, hyperbolic trig functions
    ! Functions like modulus, ceil, floor, round, etc.,

    print *, "x = ", x, "y = ", y
    print *, "The distance is:", r
    print *, "The angle in degrees is:", ad
    !print *, "The angle in degrees in integer is:", ai
    !print *, "The angle in degrees in real after integer is:", arr
    print *, "The angle in radians is:", ar

! in quad1 x + y +
! in quad2 x - y +
! in quad3 x - y -
! in quad4 x + y -

! == .eq. equal to
! > .gt. greater than
! < .lt. less than
! >= .ge. greater than or equal to
! <= .le. less than or equal to
! /= .ne. not equal to

! .true. or .false.
! .not.(exp1)
! (exp1).and.(exp2)
! (exp1).or.(exp2)
! (exp1).eqv.(exp2)
! (exp1).neqv.(exp2)


!    if (x >= 0 ) then
!        if ( y >= 0) then
!            q = '1'
!        else
!            q = '4'
!        end if
!    else
!        if ( y >= 0) then
!            q = '2'
!        else
!            q = '3'
!        end if
!    end if

    if ((x .ge. 0) .and. (y >= 0)) then
        q = '1'
    else if ((x >= 0) .and. (y .le. 0)) then
        q = '4'
    else if (x .le. 0 .and. y >= 0) then
        q = '2'
    else
        q = '3'
    end if

    print *, "The point is in quadrant:", q

    ! UPEMDAS RO LO

end program quadrant
