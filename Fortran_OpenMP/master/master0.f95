! program to demonstrate master construct.
! This construct makes sure that the commands
! are executed by the master thread alone.

program master0

    use omp_lib
    implicit none
   
    integer, parameter :: num_threads = 4
    integer, parameter :: throws = 1000
    real*8  :: rand_val=0.0
    integer :: ind = 0, i, j, sum1 = 0
    integer, dimension(1:6) :: dice = 0
    integer :: values(1:8), k
    integer, dimension(:), allocatable :: seed
    integer :: istart, iend, thread_num     ! do loop iterators
    integer :: ppt                          ! Points per thread
    
    ! calls date and time subroutine to get the milli-second
    ! value in value(8)
    
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
    
    ! this subroutine decides the number of seeding values
    ! for random number generation and returns it out (k)
    call random_seed(size=k)
    print *, "k = ",k
    
    ! Creates a seed array for generating random numbers
    allocate(seed(1:k))
    ! the milli-second value is used for initializing the seed numbers
    seed(:) = values(8)
    
    print *, "Seed = ",seed
    
    ! generates a random number sequence with seed array as input.
    ! The sequence is useful for generating the random numbers
    call random_seed(put=seed)
    
    ppt = (throws+num_threads-1)/num_threads
    
    istart = 1
    iend = throws
    !$ call omp_set_num_threads(num_threads)
    
    ! generates random numbers using the sequence generated above
    !$omp parallel shared(dice, ppt, sum1) &
    !$omp private(i, istart, iend, thread_num, rand_val, ind)
    
        !$ thread_num = omp_get_thread_num()
        !$ istart = thread_num*ppt+1
        !$ iend = min(throws, thread_num*ppt+ppt)
        
        !$ print *, "thread_num = ", thread_num, " istart = ",istart, "iend =",iend

        do i = istart, iend
            call random_number(rand_val)
            ind = floor(rand_val*6.0) + 1
	    print *, "i = ",i, "and Ind = ", ind
            ! ind = ceiling(rand_val*6.0) ! this is an alternate answer
            dice(ind) = dice(ind) + 1
        end do
        
        !$omp barrier
     !!$omp end parallel
        
        !$omp master
	    !$ print *, "Master block done by thread number :", omp_get_thread_num()
		    
            do j=1,6
                sum1 = sum1 + dice(j)
            end do
            if(sum1 == throws) then
                print *, "Throws = ", throws
                print *, "Throws are closed! sum = ", sum1
                print *, "Index  count     fraction"
                do j=1,6
                    write(*,'(i2,3x,i11,3x,f13.6)'),j,dice(j),(real(dice(j))/real(sum1))
                end do
            else
                print *, "Throws = ", throws
                print *, "Throws are not closed! sum = ", sum1
            end if
        !$omp end master
    !$omp end parallel
    
end program master0
