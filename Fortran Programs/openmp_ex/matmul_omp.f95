! Program to do a matrix multiplication in parallel.
! OpenMP is used. This is a demo!

program par_matmul

    use omp_lib ! Used for including openmp subroutines
    implicit none
    integer, parameter :: n = 2000
    
    !$ integer :: num_threads = 4
    ! The above statement is called only when openmp is enabled
    
    integer :: i, j, k
    integer, dimension(n,n) :: a, b, c
    real :: t1, t2, ep

    !$ print *, "Number of threads used : ",num_threads
    
    !$ call omp_set_num_threads(num_threads)
    ! Here, you set the number of processors to be used
    
    a = 1
    b = 0
    do i = 1,n
        b(i,i) = 1
    end do
    c = 0
    
    call cpu_time(t1) ! You are invoking a system timer here.
    
    ! Beginning the parallel block
    !$omp parallel do private(j, k)
    do i = 1,n
        do j = 1,n
            do k = 1,n
                c(i,j) = c(i,j) + a(i,k)*b(k,j)
            end do
        end do
    end do
    !$omp end parallel do
    ! Ending the parallel block
   
    call cpu_time(t2) ! You are invoking a system timer here.
    ep = t2 - t1
    
    !$ ep = ep/num_threads
    ! If not done, it will add the individual time of all processors used
    
    print *, "Time for multiplication for loop in seconds:", ep
    
end program par_matmul
