! Program to demonstrate the where operation, date and time and random
! numbers

program where_cons

    implicit none
    integer, parameter :: r = 2, c = 3
    integer :: values(1:8), k
    logical, dimension(r,c) :: p_n
    integer, dimension(:), allocatable :: seed
    real*8, dimension(r,c) :: randmat1, randmat2
    
    call date_and_time(values=values)
    
!    VALUES is INTENT(OUT) and provides the following:
!    VALUES(1):	The year 
!    VALUES(2):	The month 
!    VALUES(3):	The day of the month 
!    VALUES(4):	Time difference with UTC in minutes 
!    VALUES(5):	The hour of the day 
!    VALUES(6):	The minutes of the hour 
!    VALUES(7):	The seconds of the minute 
!    VALUES(8):	The milliseconds of the second 

    call random_seed(size=k)
    print *, "k = ",k
    
    allocate(seed(1:k))
    seed(:) = values(8)
    
    print *, "Seed = ",seed
    call random_seed(put=seed)
    
    call random_number(randmat1)
    
    print *, "The date and time is:"
    call print_mat1(values,8)
    
    print *, "The Random Matrix 1 is:"
    call print_matr2(randmat1,r,c)
    
    call random_number(randmat2)
    
    where (randmat1 < 0.5)
        randmat2 = -randmat2
    end where
    
    where (randmat2 > 0)
        p_n = .true.
    elsewhere
        p_n = .false.
    end where
    
    print *, "The Random Matrix 2 is:"
    call print_matr2(randmat2,r,c)
    
    print *, "The Positive or Negative Matrix is:"
    call print_matl2(p_n,r,c)
    
end program where_cons

subroutine print_matr2(a,n,m)

    implicit none
    integer, intent(in) :: n,m
    real*8, dimension(n,m), intent(in) :: a
    integer :: i,j
    
    do i=1,n
        write(*,'("|")',advance='no')
        do j=1,m
            write(*,'(f8.3,t3)',advance='no'),a(i,j)
        end do
        write(*,'("|")')
    end do

end subroutine

subroutine print_matl2(a,n,m)

    implicit none
    integer, intent(in) :: n,m
    logical, dimension(n,m), intent(in) :: a
    integer :: i,j
    
    do i=1,n
        write(*,'("|")',advance='no')
        do j=1,m
            write(*,'(l4,t3)',advance='no'),a(i,j)
        end do
        write(*,'("|")')
    end do

end subroutine

subroutine print_mat1(a,n)

    implicit none
    integer, intent(in) :: n
    integer, dimension(n), intent(in) :: a
    integer :: i
    
    do i=1,n
        write(*,'("|",i6,"|")'),a(i)
    end do

end subroutine
