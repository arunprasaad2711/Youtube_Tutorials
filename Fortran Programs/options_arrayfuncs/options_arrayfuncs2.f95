! Program to demonstrate optional parameters and array valued functions

module matrix

    implicit none
    contains
    
function mat_mul(a, b, d) result(c)

    implicit none
    integer :: i, j, k, r1, c1, r2, c2
    integer, dimension(2) :: s1, s2
    integer, optional :: d
    real*8, dimension(:,:), intent(in) :: a, b
    real*8, dimension(size(a)/size(a(:,1)), size(b)/size(b(1,:))) :: c
    
    s1 = shape(a)
    r1 = s1(1)
    c1 = s1(2)
    
    s2 = shape(b)
    r2 = s2(1)
    c2 = s2(2)
    
    c = 0
    
    if (present(d)) then
        print *, "Debugging on!"
        print *, "size(a)/size(a(1,:))"
        print *, size(a)/size(a(1,:))
        print *, "size(b)/size(b(:,1))"
        print *, size(b)/size(b(:,1))
        print *, "r1:"
        print *, r1
        print *, "c1:"
        print *, c1
        print *, "r2:"
        print *, r2
        print *, "c2:"
        print *, c2
    end if
    
    if ( c1 == r2 ) then
        do k = 1 , c1
            do j = 1, c2
                do i = 1, r1
                    c(i,j) = c(i,j) + a(i,k)*b(k,j)
                end do
            end do
        end do
    end if
    
end function mat_mul

end module matrix

program opts_arrfunc

    use matrix
    implicit none
    integer, parameter :: r1 = 3, c1 = 2, r2 = 2, c2 = 3
    integer :: i, j
    real*8, dimension(r1,c1) :: a = 1.0
    real*8, dimension(r2,c2) :: b = 1.0
    real*8, dimension(r1,c2) :: c
    !real*8, external :: mat_mul
    
!    interface mat
    
!        function mat_mul(a, b, d) result(c)
!            implicit none
!            integer :: i, j, k, r1, c1, r2, c2
!            integer, dimension(2) :: s1, s2
!            integer, optional :: d
!            real*8, dimension(:,:), intent(in) :: a, b
!            real*8, dimension(size(a)/size(a(:,1)), size(b)/size(b(1,:))) :: c
!        end function mat_mul
        
!    end interface mat
    
    c = mat_mul(a, b, 65)
    
    print *, "The product matrix is:"
    do i = 1, r1
        do j = 1, c2
            write(*,'(f10.4 t3)',advance='no'), c(i,j)
        end do
        write(*,*)
    end do

end program opts_arrfunc
