! Program to demonstrate parallel if clause

program parallel_if

    use omp_lib
    implicit none
    
    integer, parameter :: num_threads = 5
    integer :: thread_num = -1
    
    !$ call omp_set_num_threads(num_threads)
    
    !$omp parallel if(num_threads > 4) default(none) private(thread_num)
    !!$omp parallel if(num_threads > 4) default(none) firstprivate(thread_num)
        !$ thread_num = omp_get_thread_num()
        print *, "If clause done by thread number ", thread_num
    !$omp end parallel

end program parallel_if
