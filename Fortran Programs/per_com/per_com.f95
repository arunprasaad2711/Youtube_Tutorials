! Program to find permutation and combination via functions

program percom

    implicit none
    integer*8, external :: per, comm, com, comb
    integer*8 :: n,r,per1,com1,com2,com3
    
    print *, "Enter the value of n:"
    read *, n
    print *, "Enter the value of r:"
    read *, r
    
    per1 = per(n,r)
    com1 = com(per1,r)
    com2 = comm(n,r)
    com3 = comb(n,r)
    
    print *, "The permutation of ",r," in ",n, " :",per1
    print *, "The combination1 of ",r," in ",n, " :",com1
    print *, "The combination2 of ",r," in ",n, " :",com2
    print *, "The combination3 of ",r," in ",n, " :",com3
    
    !contains

end program percom
