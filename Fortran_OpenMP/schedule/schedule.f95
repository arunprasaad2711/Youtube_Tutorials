! Program to use schedule clause
! Four types: static, dynamic, guided and runtime

program schedule_clause

    use omp_lib
    implicit none
    
    integer, parameter :: num_threads = 4, m = 12
    integer :: thread_num
    integer :: i
    
    thread_num = 0
    !$ call omp_set_num_threads(num_threads)
    
    !$omp parallel do private(thread_num) &
    !$omp schedule(guided, 5)
        do i = 0, m-1
            !$ thread_num = omp_get_thread_num()
            print *, "Iteration ", i, " done by thread ", thread_num
        end do
    !$omp end parallel do

end program schedule_clause
