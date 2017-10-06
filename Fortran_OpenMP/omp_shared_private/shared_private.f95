! Program to use openmp shared and private clause
! Example of Coarse-grain parallelism: Splitting the entire job/problem
! into big pieces and making each core/thread do a certain piece.

program share_private

    use omp_lib
    implicit none
    
    integer :: num_threads = 4
    integer, parameter :: m = 100000000
    real*8, dimension(1:m) :: a
    real*8, parameter :: pi = 4.0*atan(1.0)
    integer :: istart, iend, thread_num     ! do loop iterators
    real*8 :: t1, t2, ep                    ! Timing variables
    integer :: i
    real*8 :: dx, l=10.0, x                 ! Length parameters
    integer :: ppt                          ! Points per thread
    
    a = 0
    dx = l/(m-1)
    
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
        
        do i = istart, iend
            x = (i-1)*dx
            a(i) = (sin(2*pi*x/l))**2 + (cos(2*pi*x/l))**2
        end do
        
        !$omp critical
            !$ print *,"thread_num=",thread_num, " istart=",istart," iend=",iend
        !$omp end critical
    
    !$omp end parallel
    
    call cpu_time(t2)
    ep = t2-t1
    !$ ep = ep/num_threads
    
    !$ print *, "OpenMP mode!"
    !print *, "Values of a:", a
    print *, "Time taken for execution:", ep, " seconds"

end program share_private
