! program to demonstrate master construct.
! This construct makes sure that the commands
! are executed by the master thread alone.
! All other threads skip this block

program master1

    use omp_lib
    implicit none
   
    integer, parameter :: num_threads = 4
    integer, parameter :: n = 12
    integer :: i
    real*8  :: b(1:n) = 0.0, a = 100.0
    integer :: istart, iend, thread_num     ! do loop iterators
    integer :: ppt                          ! Points per thread
    
    ppt = (n+num_threads-1)/num_threads
    
    istart = 1
    iend = n
    !$ call omp_set_num_threads(num_threads)
    
    !$omp parallel shared(a, ppt, b) &
    !$omp private(i, istart, iend, thread_num)
    
	!$omp master
	    !$ thread_num = omp_get_thread_num()
	    !$ print *, "Master block done by thread number :", thread_num
	    !$ a = real(thread_num) + 200.0
        !$omp end master
	
	!$omp barrier
    
        !$ thread_num = omp_get_thread_num()
        !$ istart = thread_num*ppt+1
        !$ iend = min(n, thread_num*ppt+ppt)
        
        !$ print *, "thread_num = ", thread_num, " istart = ",istart, "iend =",iend

        do i = istart, iend
           b(i) = a
        end do
	
    !$omp end parallel
    
       print *, " Serial Value of a = 100.0"
    !$ print *, " Parallel Value of a = 200.0"
    
    do i = 1, n
        print '("Array b(",i2,") = ",f15.6)', i, b(i)
    end do
    
end program master1
