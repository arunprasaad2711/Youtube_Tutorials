! program to do a matrix multiplication in parallel

program matmul1

    implicit none
    integer, parameter :: n = 1000
    integer :: i, j, k
    integer, dimension(n,n) :: a, b, c
    real :: t1, t2, ep

    a = 1
    b = 0
    do i = 1,n
        b(i,i) = 1
    end do
    c = 0
    call cpu_time(t1)
    
    do i = 1,n
        do j = 1,n
            do k = 1,n
                c(i,j) = c(i,j) + a(i,k)*b(k,j)
            end do
        end do
    end do
   
    call cpu_time(t2)
    ep = t2 - t1
    
    !print *, c
    print *, "Time for multiplication for loop in seconds:", ep
    
    a = 1
    b = 0
    do i = 1,n
        b(i,i) = 1
    end do
    c = 0
    
    call cpu_time(t1)
    
    c = matmul(a,b)
    
    call cpu_time(t2)
    
    ep = t2 - t1
    
    !print *, c
    print *, "Time for multiplication for command in seconds:", ep
    
end program matmul1
