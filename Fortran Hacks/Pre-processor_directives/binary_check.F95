! Program to save binary values

!#define SEQ
#define DIR

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
        
#ifdef SEQ
    print *, "File Access in Sequential Mode!"
#endif
#ifdef DIR
    print *, "File Access in Direct Mode!"
#endif
    
    allocate(a(m,n,o,p),b(m,n,o,p),c(m,n,o,p),d(m,n,o,p), &
        & e(m,n,o,p),f(m,n,o,p))
    
    a = 2.0
    b = 10.0
    
    c = a + b
    
    print *, "Writing data to file!"
    
    open (unit=100, file='out1.bin', &
        &   form='unformatted',      &
#ifdef DIR
        &   access='direct',         &
        &   recl=m*n*o*p*8)
#endif
#ifdef SEQ
        &   access="sequential")
#endif

#ifdef DIR
    write(100, rec=1), a
#endif
#ifdef SEQ
    write(100), a
#endif
    print *, "Written A data to file!"
#ifdef DIR
    write(100, rec=2), b
#endif
#ifdef SEQ
    write(100), b
#endif
    print *, "Written B data to file!"
#ifdef DIR
    write(100, rec=3), c
#endif
#ifdef SEQ
    write(100), c
#endif
    print *, "Written C data to file!"
    
    close(100)
    
    print *, "Reading data from file!"
    
    open (unit=200, file='out1.bin', &
        &   form='unformatted',      &
#ifdef DIR
        &   access='direct',         &
        &   recl=m*n*o*p*8)
#endif
#ifdef SEQ
        &   access="sequential")
#endif

#ifdef DIR
    read(200, rec=1), d
#endif
#ifdef SEQ
    read(200), d
#endif
    print *, "Read D data from file!"
#ifdef DIR
    read(200, rec=2), e
#endif
#ifdef SEQ
    read(200), e
#endif
    print *, "Read E data from file!"
#ifdef DIR
    read(200, rec=3), f
#endif
#ifdef SEQ
    read(200), f
#endif
    print *, "Read F data from file!"
    
    close(200)
    
    print *, "Max value in D : ", maxval(d)
    print *, "Max value in E : ", maxval(e)
    print *, "Max value in F : ", maxval(f)
    
    deallocate(a,b,c,d,e,f)
    
end program binary_check
