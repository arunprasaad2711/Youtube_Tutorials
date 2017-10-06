! Program to demonstrate parallel ordered clause

program ordered_ex

    use omp_lib
    implicit none
    
    integer, parameter :: num_threads = 4
    integer, parameter :: n = 8
    integer, dimension(0:n-1) :: a = 0
    integer :: thread_num = 0, i
    
    !$ call omp_set_num_threads(num_threads)
    
    !$omp parallel do default(none) ordered schedule(static) &
    !$omp private(thread_num, i) shared(a)
    
        do i = 0, n-1
	
	    !$ thread_num = omp_get_thread_num()
	    
	    !$omp ordered
                print '("Thread number ",i2," updated a[",i2,"]")', thread_num, i
                a(i) = a(i) + i
	    !$omp end ordered
	    
	    !$omp ordered
                print '("Thread number ",i2," prints the value of a[",i2,"] = ",i2)', thread_num, i, a(i)
	    !$omp end ordered
        end do
	
    !$omp end parallel do

end program ordered_ex
