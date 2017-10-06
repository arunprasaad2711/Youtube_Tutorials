! Program to explain Parallel do block
! For very small processes,
! t_serial < t_parallel
! because the overhead for parallel process (splitting the job among
! threads) is significant.
! for large processes,
! t_serial > t_parallel
! because, due to the problem size, the parallel overheads are smaller
! Ideal speedups (speed_up ~= num_threads ~= t_serial/t_parallel)
! are possible in small thread numbers only!

program parallel_do_ex

    use omp_lib
    implicit none
    
    integer :: num_threads = 8
    integer, parameter :: m = 100, n = 100000, o = 100
    integer :: i, j, k
    real*8, dimension(1:m, 1:n) :: a 
    real*8, dimension(1:n, 1:o) :: b
    real*8, dimension(1:m, 1:o) :: c
    real*8 :: t1, t2, ep
    
    a = 1.0
    b = 1.0
    c = 0.0
    
    !$ call omp_set_num_threads(num_threads)
    
    call cpu_time(t1) ! You are invoking a system timer here.
    
    ! if you use parallel block instead of parallel do, then the
    ! matrix multiplication happens "thread_num" times!!!
    !$omp parallel do
        do i = 1, m
            do j = 1, o
                do k = 1, n
                    c(i,j) = c(i,j) + a(i,k)*b(k,j)
                end do
            end do
        end do
    !$omp end parallel do
    
    call cpu_time(t2) ! You are invoking a system timer here.
    ep = t2 - t1
    
    !$ ep = ep/num_threads
    ! If not done, it will add the individual time of all threads used
    ! This is a crude method! A better time calculation is available
    
    !$ print *, "Parallel Mode on!"
    print *, "Time for multiplication for loop in seconds:", ep
    
    print *, "A sample value:", c(10, 10)

end program parallel_do_ex
