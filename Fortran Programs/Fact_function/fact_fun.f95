! Program to return factorial of n numbers using a single function
! Defining Functions that return arrays are a bit tricky. All alone in a
! file, running them may be erroneous. Defining them with external and
! Dimension keyword may not help.

! Soultions:
! 1. Use contains keyword and define the function within the program
! 2. Use a module to contain the function and use it

program fact_fun

    use fact1
    implicit none
    integer, parameter :: n=20
    integer*8 :: i
    integer*8, dimension(n) :: num,numfact
    !integer*8, external, dimension(n) :: fac_num !May not work
    
    num(1:n) = [(i, i=1,n)]
    numfact = fac_num(num,n)
    
    do i=1,n
        print *, "The ",i,"! is:",numfact(i)
    end do
    
end program fact_fun


