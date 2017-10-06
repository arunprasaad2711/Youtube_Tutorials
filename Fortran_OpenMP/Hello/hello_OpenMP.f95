! Program to display a hello world message in fortran using openmp

program hello

    ! Include this module/library for OpenMP
    use omp_lib
    implicit none
    
    ! OpenMP Commands
    ! 1. Directive or block or clause
    !    !$omp <directive-name> [[clause1][clause2]...] {extra}
    !        ............
    !    !$omp end <directive-name> {extra}
    ! 2. Normal commands or pre processor directives
    !    !$ .....
    
    ! 1 thread for 1 processor or
    ! 2 threads for 1 processor
    
    integer :: num_threads = 16
    integer :: thread_num = 0
    !$ call omp_set_num_threads(num_threads)
    print*, "Display Hello world!"
    print*, "Number of threads used = ", num_threads
    
    !intendations are for reference only!
    
    !$omp parallel
        !$omp critical
            !$ thread_num = omp_get_thread_num()
            print *, "Hello world from thread number ", thread_num
        !$omp end critical
    !$omp end parallel
    
end program hello
