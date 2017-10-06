! Program to explain the forall statement

program forall_l

    implicit none
    integer, parameter :: n = 3
    real*8, dimension(n,n) :: a, b, b1, b2, b3
    integer :: i, j
    
    a = reshape((/1,2,3,4,5,6,7,8,9/),(/n,n/))
    b2 = a
    b3 = a
    b = -1.0

    print *, "The matrix a is:"
    call print_mat2(a,n,n)
    
    forall( i = 1:n, j = 1:n)!, a(i,j) /= 8.and.i/=3)
        b(i,j) = a(i,i)*a(j,j) 
    end forall
    
    do i=1,n
        do j=1,n
            b1(i,j) = a(i,i)*a(j,j)
        end do
    end do
    
    print *, "The matrix b is:"
    call print_mat2(b,n,n)
    
    print *, "The matrix b1 is:"
    call print_mat2(b1,n,n)
    
    forall( i = 1:n, j = 1:n) 
        a(i,j) = a(i,i)*a(j,j) 
    end forall

    forall( i = 1:n)
        forall(j = 1:n)
            b3(i,j) = b3(i,i)*b3(j,j)
        end forall 
    end forall

    
    print *, "The matrix a is:"
    call print_mat2(a,n,n)
    
    do i=1,n
        do j=1,n
            b2(i,j) = b2(i,i)*b2(j,j)
        end do
    end do
    
    print *, "The matrix b2 is:"
    call print_mat2(b2,n,n)
    
    print *, "The matrix b3 is:"
    call print_mat2(b3,n,n)
    
end program forall_l

subroutine print_mat2(a,n,m)

    implicit none
    integer, intent(in) :: n,m
    real*8, dimension(n,m), intent(in) :: a
    integer :: i,j
    
    do i=1,n
        write(*,'("|")',advance='no')
        do j=1,m
            write(*,'(f8.3,t3)',advance='no'),a(i,j)
        end do
        write(*,'("|")')
    end do

end subroutine
