! Program to use openmp sections clause
! 
program sections1

    use omp_lib
    implicit none
    
    integer :: num_threads = 5
    real*8 :: t1, t2, ep                    ! Timing variables
    integer :: thread_num
    integer, parameter :: m = 1000, n = 1000
    integer :: i, j, k
    real*8, dimension(m,n) :: a, b, c, d, e
    
    a = 1.0
    b = 0.0
    c = 0.0
    d = 0.0
    e = 0.0
    
    !$ call omp_set_num_threads(num_threads)
    
    call cpu_time(t1)
    
    !$omp parallel 
    !$omp sections private(i, j, thread_num) 
    
        !$omp section
        !$ thread_num = omp_get_thread_num()
        !$ print *, "Section 1: mat_sq started by thread number:",thread_num
        do k = 1, m
            do j = 1, n
                do i = 1, m
                    b(i,j) = b(i,j) + a(i,k)*a(k,j)
                end do
            end do
        end do
        !$ print *, "Section 1: mat_sq finished by thread number:",thread_num
        
        !$omp section
        !$ thread_num = omp_get_thread_num()
        !$ print *, "Section 2: mat_opt started by thread number:",thread_num
        do j = 1, m
            do i = 1, n
                c(i,j) = a(i,j)*4*(i+j)
            end do
        end do
        !$ print *, "Section 2: mat_opt finished by thread number:",thread_num
        
        !$omp section
        !$ thread_num = omp_get_thread_num()
        !$ print *, "Section 3: mat_square started by thread number:",thread_num
        do j = 1, m
            do i = 1, n
                d(i,j) = a(i,j)**2 + 1.0
            end do
        end do
        !$ print *, "Section 3: mat_square finished by thread number:",thread_num
        
        !$omp section
        !$ thread_num = omp_get_thread_num()
        !$ print *, "Section 4: mat_coeff started by thread number:",thread_num
        do j = 1, m
            do i = 1, n
                e(i,j) = a(i,j)*4
            end do
        end do
        !$ print *, "Section 4: mat_coeff finished by thread number:",thread_num
        
    !$omp end sections
    !$omp end parallel
    
    call cpu_time(t2)
    ep = t2-t1
    !$ ep = ep/num_threads
    
    !$ print *, "OpenMP mode!"
    !print *, "Values of a:", a
    print *, "Time taken for execution:", ep, " seconds"

end program sections1
