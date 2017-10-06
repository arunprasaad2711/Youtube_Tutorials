! This program finds the perimeter and area of a triangle
! Using hero's formula

Program area_tri

    implicit none;

    ! integer  4 687, -1954
    ! real      -45, +567.895
    ! double   real numbers only
    ! character  storing letters, numbers and symbols, strings,
    ! complex  complex numbers 1+7j or -6+8i 8-46i integers or real
    ! logical .true. or .false.
    ! All variables, program names, subroutine names, function names etc., are case INSENSITIVE!
    ! a A a = A, win = WIN = wiN = WiN = Win

    real :: a,b,c,peri,s,area

    !a = 3
    !b = 4
    !c = 5  ! area is 6 units

    print *, "Enter the sides of the triangle!"
    read *, a,b,c

    peri = a+b+c
    s = peri/2

    Area = (s*(s-a)*(s-b)*(s-c))**0.5

    ! Addition +
    ! Subtraction -
    ! Multiplication *
    ! Division /
    ! Power (2^3 = 8) **
    ! Modulus mod  returns the remainder of a division.

    ! a*b-c**4 (a*b)-(c**4)
    ! Operator precedence
    ! Thumb rule UPEMDAS Unary (sign in the variable front) Parenthesis () Exponent ** Multiply and Divide, Add, subtract
    ! Please Excuse My Dear Aunt Sally

    print *, "The sides of the triangle are:"
    print *, "a = ",a, "b = ",b, "and c = ", c
    print *, "The perimeter of the triangle is:",PeRi
    print *, "The area of the triangle is:", AREA

END program area_tri
