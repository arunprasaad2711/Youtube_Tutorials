! Program to find the solution for a system of simultaneous linear
! Equations


program crammer

    use maths1
    implicit none
    integer, parameter :: n = 3
    integer :: i,j
    real*8, dimension(n,n,n+1) :: a
    real*8, dimension(n,1) :: b, x
    
    a(:,:,1) = reshape((/3.0,2.0,-1.0,2.0,-2.0,0.5,-1.0,4.0,-1.0/),(/n,n/))
    b = reshape((/1.0,-2.0,0.0/),(/n,1/))
    
    !a(:,:,1) = get_a(n)
    !b = get_b(n)
    
    call cram(x,a,b,n)
    
    print *, "Matrix A|b:"
    do i=1,n
        write(*,'("|")',advance='no')
        do j=1,n
            write(*,'(f8.3,t3)',advance='no'),a(i,j,1)
        end do
        write(*,'(" | ",f8.3)'),b(i,1)
    end do
    
    print *, "Matrix Xa:"
    do i=1,n
        do j=1,n
            write(*,'(f8.3,t3)',advance='no'),a(i,j,2)
        end do
        write(*,*)
    end do
    
    print *, "Matrix Xb:"
    do i=1,n
        do j=1,n
            write(*,'(f8.3,t3)',advance='no'),a(i,j,3)
        end do
        write(*,*)
    end do
    
    print *, "Matrix Xc:"
    do i=1,n
        do j=1,n
            write(*,'(f8.3,t3)',advance='no'),a(i,j,4)
        end do
        write(*,*)
    end do
    
    print *,"The Solution is:"
    do i=1,n
        print *, x(i,1)
    end do

end program crammer
