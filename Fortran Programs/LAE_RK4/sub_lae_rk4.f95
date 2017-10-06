! RK4 subroutine for LAE

subroutine sub_lae_rk4(c, k, u, dx, dt, sh)
!subroutine sub_lae_rk4(k, u, sh)

    implicit none
    integer, intent(in) :: sh
    real, intent(in), dimension(sh) :: u
    real, intent(inout), dimension(sh) :: k
    real, intent(in) :: c, dx, dt
    integer :: i,j
    
    !sh = size(u)
    !k(1) = u(sh)
    
    k(2:sh) = [(-c*dt*(u(i)-u(i-1))/dx, i = 2,sh)]
    !k(2:sh) = [( u(i)-u(i-1), i = 2,sh)]

end subroutine sub_lae_rk4
