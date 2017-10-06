! Subroutine to calculate the RK4 for lae, for python

subroutine sub_lae_rk4(c, k, u, dx, dt, sh)
!subroutine sub_lae_rk4(k, u, sh)

    implicit none
    integer, intent(in) :: sh
    real(kind=8), intent(in), dimension(sh) :: u
    real(kind=8), intent(inout), dimension(sh) :: k
    real(kind=8), intent(in) :: c, dx, dt
    integer :: i
    
    !sh = size(u)
    !k(1) = u(sh)
    
    k(2:sh) = [(-c*dt*(u(i)-u(i-1))/dx, i = 2,sh)]
    !k(2:sh) = [( u(i)-u(i-1), i = 2,sh)]

end subroutine sub_lae_rk4
