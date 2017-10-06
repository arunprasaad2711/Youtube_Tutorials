! Program to demonstrate pure subroutines and pure functions
! Rules for pure functions and pure subroutines
! 1. All optional/dummy arguments must be of type intent(in)
! 2. All intent(in) variables should not be accidentally modified
!    however, intent(out) and intent(inout) variables can be changed
! 3. No SAVE attribute inside the function/subroutine
! 4. Subroutine/function should not handle global variables and save 
!    variables
! procedure = functions or subroutines
! 5. This procedure should call only pure procedures
! 6. No input and output operations inside procedures 

program pure_ex

    implicit none
    integer, parameter :: n=20
    integer*8 :: i
    integer*8, dimension(n) :: num, numfacts
    integer*8, external :: fac_num
    
    num(1:n) = [(i, i=1,n)]
    numfacts(1:n) = [(fac_num(num(i)), i=1,n)]
    
    do i=1,n
        print *, "The ",i,"! is:",numfacts(i)
    end do

end program pure_ex

pure integer*8 function fac_num(num) result(fact)

    implicit none
    integer*8, intent(in) :: num
    integer*8 :: i
    !save i
    
    !print *, "Num = ", num
    !read *, num
    !write(*,*), num
    
    fact = 1
    
    do i=1,num
        fact = fact*i
    end do
    
    return

end function fac_num
