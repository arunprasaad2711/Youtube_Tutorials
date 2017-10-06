! Program to demostrate do loops via geometric progression

program geo_prog

    implicit none
    integer(kind = 16) :: a, r, i, n
    
    print *, "Enter the value of initial term, a and factor, r:"
    read *, a,r
    print *, "Enter the number of terms:"
    read *, n
    
    do i=0,n ! i = 1,2,3,4,5, ...., n
    
        print *, "The value ", i, " of the series is:", a*(r**i)
    
    end do

end program geo_prog
