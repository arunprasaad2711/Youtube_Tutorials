! Program to demonstrate num_threads clause

program number_threads

    use omp_lib
    implicit none
    
    integer, parameter :: n_threads = 3, n = 2
    integer :: thread_num = -1
    
    !$ call omp_set_num_threads(n_threads)
    
    !$omp parallel if(n_threads >= 4) num_threads(n) default(none) firstprivate(thread_num)
    !!$omp parallel num_threads(n) default(none) firstprivate(thread_num)
    !!$omp parallel default(none) firstprivate(thread_num)
        !$ thread_num = omp_get_thread_num()
        print *, "If clause done by thread number ", thread_num
    !$omp end parallel

end program number_threads
