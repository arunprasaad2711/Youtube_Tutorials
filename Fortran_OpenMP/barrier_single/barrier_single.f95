! Program to use openmp single and barrier directives
! Example of Coarse-grain parallelism: Splitting the entire job/problem
! into big pieces and making each core/thread do a certain piece.

program barrier_single

    use omp_lib
    implicit none
    
    integer :: num_threads = 4
    integer, parameter :: m = 1000000000
    real*8, parameter :: pi = 4.0*atan(1.0)
    integer :: istart, iend, thread_num     ! do loop iterators
    real*8 :: t1, t2, ep                    ! Timing variables
    integer :: i
    real*8 :: dx, x, l=90.0                 ! Length parameters
    real*8 :: sum1, sum2                    ! Sum Parameters
    integer :: ppt                          ! Points per thread
    
    dx = l*pi/(180.0*(m-1))
    
    ppt = (m+num_threads-1)/num_threads
    
    istart = 1
    iend = m
    
    sum1 = 0.0
    sum2 = 0.0
    !$ call omp_set_num_threads(num_threads)
    
    call cpu_time(t1)
    
    !$omp parallel default(none) private(istart, iend, &
    !$omp  thread_num, i, x, sum1) shared(dx, ppt, sum2)
    
        !$ thread_num = omp_get_thread_num()
        !$ istart = thread_num*ppt+1
        !$ iend = min(m, thread_num*ppt+ppt)
        
        do i = istart, iend
            x = (i-1)*dx
            sum1 = sum1 + sin(x)*dx
        end do
        
        !$omp barrier
        
        !$omp critical
            sum2 = sum2 + sum1
        !$omp end critical
        
        !$omp single
            !$ print *, "Single construct performed by thread:", thread_num
            print *, "Area of the integral is: ", sum2
        !$omp end single
    
    !$omp end parallel
    
    call cpu_time(t2)
    ep = t2-t1
    !$ ep = ep/num_threads
    
    !$ print *, "OpenMP mode!"
    print *, "Time taken for execution:", ep, " seconds"

end program barrier_single
