! Program to demonstrate no wait clause

program no_wait

    use omp_lib
    implicit none
    
    integer :: num_threads = 8
    integer :: thread_num, i, j
    integer, parameter :: m = 100, n = 100, o = 100
    real*8, dimension(m, n) :: a
    real*8, dimension(n, o) :: b
    real*8, dimension(m, o) :: c
    integer :: istart, iend                 ! do loop iterators
    integer :: jstart, jend                 ! do loop iterators
    real*8 :: t1, t2, ep                    ! Timing variables
    integer :: ppt1, ppt2                   ! Points per thread
    
    ppt = (m+num_threads-1)/num_threads
    
    istart = 1
    iend = m
    !$ call omp_set_num_threads(num_threads)
    
    call cpu_time(t1)
    
    !$omp parallel default(shared) private(istart, iend, &
    !$omp  thread_num, i, x) shared(l, dx, a, ppt)
    
        !$ thread_num = omp_get_thread_num()
        !$ istart = thread_num*ppt+1
        !$ iend = min(m, thread_num*ppt+ppt)

end program no_wait
