# 1 "binary_check.F95"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "binary_check.F95"
! Program to save binary values

!#define SEQ


program binary_check

    implicit none
    
    integer :: m, n, o, p
    real*8, allocatable, dimension(:,:,:,:) :: a, b, c, d, e, f
    
    m = 10
    n = 10
    o = 10
    p = 10
    
    print *, "The size of storage will be : ",m*n*o*p*8, " bytes for &
        & one 4D array"
        




    print *, "File Access in Direct Mode!"

    
    allocate(a(m,n,o,p),b(m,n,o,p),c(m,n,o,p),d(m,n,o,p), &
        & e(m,n,o,p),f(m,n,o,p))
    
    a = 2.0
    b = 10.0
    
    c = a + b
    
    print *, "Writing data to file!"
    
    open (unit=100, file='out1.bin', &
        &   form='unformatted',      &

        &   access='direct',         &
        &   recl=m*n*o*p*8)






    write(100, rec=1), a




    print *, "Written A data to file!"

    write(100, rec=2), b




    print *, "Written B data to file!"

    write(100, rec=3), c




    print *, "Written C data to file!"
    
    close(100)
    
    print *, "Reading data from file!"
    
    open (unit=200, file='out1.bin', &
        &   form='unformatted',      &

        &   access='direct',         &
        &   recl=m*n*o*p*8)






    read(200, rec=1), d




    print *, "Read D data from file!"

    read(200, rec=2), e




    print *, "Read E data from file!"

    read(200, rec=3), f




    print *, "Read F data from file!"
    
    close(200)
    
    print *, "Max value in D : ", maxval(d)
    print *, "Max value in E : ", maxval(e)
    print *, "Max value in F : ", maxval(f)
    
    deallocate(a,b,c,d,e,f)
    
end program binary_check
