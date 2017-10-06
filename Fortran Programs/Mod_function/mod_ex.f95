! Modulus operation with an example

program mod_ex

    implicit none
    integer :: d,e,q,m
    real :: a,b,qr,mr
    
    d = 51 !d = 50
    e = 10
    q = d/e
    m = mod(d,e)
    
    a = 50.00 !a = 50.04
    b = 10.0 
    qr = a/b
    mr = mod(a,b)
    
    print *, "d = ", d
    print *, "e = ", e
    print *, "q = ", q
    print *, "m = ", m
    
    print *, "a = ", a
    print *, "b = ", b
    print *, "qr = ", qr
    print *, "mr = ", mr

end program mod_ex
