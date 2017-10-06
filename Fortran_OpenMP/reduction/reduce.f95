! Program to illustrate reduction clause in OpenMP

program reduce

    use omp_lib
    implicit none
    
    integer, parameter :: num_threads = 4
    integer, parameter :: n = 10*num_threads
    integer :: i
    integer :: a(1:n), b(1:n), sum1 = 0, sum2 = 0, vdp1 = 0, vdp2 = 0
    
    !$ call omp_set_num_threads(num_threads)
    
    a(1:n) = [(i*2, i=1,n)]
    b(1:n) = [(i*2, i=1,n)]
    
    sum2 = sum(a)
    vdp2 = dot_product(a,b)
    
    !$omp parallel do reduction(+: sum1, vdp1)
    !!$omp parallel do
        do i = 1, n
        !!$omp critical
            sum1 = sum1 + a(i)
            vdp1 = vdp1 + a(i)*b(i)
        !!$omp end critical
        end do
    !$omp end parallel do
    
    print *, "Parallel Sum = ", sum1, " and Serial Sum = ", sum2
    print *, "Parallel VDP = ", vdp1, " and Serial VDP = ", vdp2

end program reduce
