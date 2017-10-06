subroutine matmul1( a, b, c, M1, N1M2, N2 )
  
    integer(kind=4),intent(in) :: M1, N2, N1M2
    real(kind=8), dimension(M1,N1M2), intent(in) :: a
    real(kind=8), dimension(N1M2,N2), intent(in) :: b
    real(kind=8), dimension(M1,N2), intent(out):: c

    integer :: i,j,k

    c = 0

    do k = 1, N1M2
        do j = 1, N2
            do i = 1, M1
                c(i,j) = c(i,j) + a(i,k)*b(k,j)
            end do
        end do
    end do

end subroutine matmul1
