! Program to use atomic construct
! Works as an alternative for critical block when "atomic" operations
! are used

program atomic

    use omp_lib
    implicit none
    
    integer, parameter :: num_threads = 4, m = 12
    integer :: thread_num
    integer :: i, j, sum1 = 0, sum2 = 0
    integer, external :: increment
    
    thread_num = 0
    !$ call omp_set_num_threads(num_threads)
    
    !$omp parallel do private(thread_num, j) &
    !$omp shared(sum1, sum2)
        do i = 0, m-1
            j = 2*i - i
            !$ thread_num = omp_get_thread_num()
            !!$omp critical
            !$omp atomic
                sum1 = sum1 + j
                sum2 = sum2 + increment(thread_num, j)
            !!$omp end critical
        end do
    !$omp end parallel do
    
    print *, "sum 1 = ", sum1
    print *, "sum 2 = ", sum2

end program atomic

integer function increment(thread_num, j)

    implicit none
    integer, intent(in) :: thread_num, j
    
    print *, "Function increment run by thread number :", thread_num
    increment = j

end function increment
