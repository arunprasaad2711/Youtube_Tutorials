subroutine matmul1( a, b, c, M1, N1M2, N2 ) bind(c, name='matmul1')

    use iso_c_binding, only: c_float, c_int

    integer(c_int),intent(in) :: M1, N1M2, N2
    real(c_float), intent(in) :: a(M1, N1M2)
    real(c_float), intent(in) :: b(N1M2, N2)
    real(c_float), intent(out):: c(M1, N2)

    integer :: i,j,k

    c = 0.0

    do k = 1, N1M2
        do j = 1, N2
            do i = 1, M1
                c(i,j) = c(i,j) + a(i,k)*b(k,j)
            end do
        end do
    end do

end subroutine matmul1

subroutine matadd1( a, b, c, NR, NC) bind(c, name='matadd1')

    use iso_c_binding, only: c_float, c_int

    integer(c_int),intent(in) :: NR, NC
    real(c_float), intent(in) :: a(NR,NC), b(NR,NC)
    real(c_float), intent(out):: c(NR,NC)

    c = a+b
    
end subroutine matadd1
