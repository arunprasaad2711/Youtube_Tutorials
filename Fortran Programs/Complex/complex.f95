! Program to work with complex numbers

program complex1

    implicit none
    complex :: a, b, c, d ! the values to be real
    
    d = (3, 4)
    
    10 format("Enter the complex number ", i1, " :")
    15 format("The Complex number ",i1," is:(",f14.5,",",f14.5,")")
    20 format(2f14.5)
    
    print 10, 1
    read 20, a
    print 10, 2
    read 20, b
    
    print *, "D = ",d
    print 15, 1, a
    print 15, 2, b
    
    print *, "The sum of a and b is :", a+b
    print *, "The difference of a and b is :", a-b
    print *, "The product of a and b is :", a*b
    print *, "The division of a and b is :", a/b
    
    print *, "The real part of c is :", real(d)
    print *, "The imaginary part of c is:", imag(d)
    print *, "The conjugate of c is:", conjg(d)
    print *, "The absolute of c is:", abs(d)
    
    print *, "The division of a and b by functions is:", a*conjg(b)/ &
    & (b*conjg(b))
    
    c = cmplx(5.7,8.9)
    print *, "C = ",c

end program complex1
