! Program to use openmp workshare clause

program share_private

    use omp_lib
    implicit none
    
    integer :: num_threads = 4
    integer*8, parameter :: m = 200000000
    real*8, dimension(1:m) :: a, b, c
    real*8 :: t1, t2, ep
    
    a = 0
    b = 0
    c = 0
    
    !$ call omp_set_num_threads(num_threads)
    
    call cpu_time(t1)
    
    !$omp parallel workshare
    !!$omp parallel
    !!$omp workshare
        a = (9.0)**2.0
        b = (1.0)**2.0
        c = a+b
    !!$omp end workshare
    !!$omp end parallel
    !$omp end parallel workshare
    
    call cpu_time(t2)
    ep = t2-t1
    !!$ ep = ep/num_threads
    
    !$ print *, "OpenMP mode!"
    print *, "Value check for a:", sum(a)/(m*81.0)
    print *, "Value check for b:", sum(b)/(m)
    print *, "Value check for c:", sum(c)/(m*82.0)
    print *, "Time taken for execution:", ep, " seconds"

end program share_private
