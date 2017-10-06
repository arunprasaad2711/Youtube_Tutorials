! Program to do gauss elimination using forall statement

program gauss_el

    use gel1
    implicit none
    integer, parameter :: n = 3
    real*8, dimension(n,n) :: a, iden
    real*8, dimension(n,n+1) :: ab, aib
    real*8, dimension(n,1) :: b,x
    real*8 :: detA, t1
    real*8, dimension(1) :: t3
    integer :: i,j,k
    
    print *, "Enter the values of Matrix A:"
    !a = get_a(n,n)
    print *, "Enter the values of Matrix b:"
    !b = get_b(n)
    
    a = reshape((/3.0,2.0,-1.0,2.0,-2.0,0.5,-1.0,4.0,-1.0/),(/n,n/))
    b = reshape((/1.0,-2.0,0.0/),(/n,1/)) ! Solution = (1, -2, -2)
    !a = reshape((/2,4,3,9/),(/2,2/))
    !b = reshape((/6,15/),(/n/))  ! Solution = (1.5,1)
    !a = reshape((/2.0,-3.0,-2.0,1.0,-1.0,1.0,-1.0,2.0,2.0/),(/n,n/))
    !b = reshape((/8.0,-11.0,-3.0/),(/n/)) ! Solution = (2, 3, -1)
    
    detA = detf(a,n)
    
    iden = get_iden(n)
    ab = get_ab(a,b,n)
    aib = ab
    
    print *, "Matrix A is:"
    call print_mat2(a,n,n)
    
    print *, "The Determinant of A is:", deta
    
    print *, "Matrix I is:"
    call print_mat2(iden,n,n)
    
    print *, "Matrix b is:"
    call print_mat1(b,n)
    
    print *, "Matrix Ab is:"
    call print_mat2(ab,n,n+1)
    
    print *, "Matrix Aib is:"
    call print_mat2(aib,n,n+1)
    
    do i = 1,n-1
        do j = i+1,n
            t1 = aib(j,i)
            do k = i,n+1
                aib(j,k) = aib(j,k)- aib(i,k)*t1/aib(i,i)
            end do
            print *,"The Matrix Aib during process:"
            call print_mat2(aib,n,n+1)
        end do
    end do
        
    print *,"The Matrix Aib after process:"
    call print_mat2(aib,n,n+1)
    
    !forall(i=1:n-1, j=i+1:n, k=i:n+1)
    !    ab(j,k) = ab(j,k) - ab(i,k)*ab(j,i)/ab(i,i)
    !end forall

!    forall(i=1:n-1)
!        forall(j=i+1:n)
!            forall(k=i:n+1)
!                ab(j,k) = ab(j,k) - ab(i,k)*ab(j,i)/ab(i,i)
!            end forall
!        end forall
!    end forall
!    The above part throws a calculation error!
    
    do i=1,n-1
        forall(j=i+1:n, k=i:n+1)
            ab(j,k) = ab(j,k) - ab(i,k)*ab(j,i)/ab(i,i)
        end forall
    end do
    
    print *,"The Matrix Ab after process:"
    call print_mat2(ab,n,n+1)
    
    do i=n,1,-1
        t3 = matmul(ab(i,1:n),x) ! This matrix multiplication returns
                                   ! a 1d matrix
        x(i,1) = (ab(i,n+1) - t3(1))/ab(i,i) ! 2D matrix work here
    end do
    
    print *, "The solution is:"
    call print_mat1(x,n)
    
end program gauss_el
