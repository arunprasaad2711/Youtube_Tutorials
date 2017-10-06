! This is the main solver module

subroutine rk4(ts)

    use params
    use model_vars
    
    implicit none
    
    integer, intent(in) :: ts
    
    ! create tendencies
    real*8, dimension(1:nx, 1:ny) :: ku1, uo, un
    real*8, dimension(1:nx, 1:ny) :: ku2, ku3, ku4
    real*8, dimension(1:nx, 1:ny) :: kv1, vo, vn
    real*8, dimension(1:nx, 1:ny) :: kv2, kv3, kv4
    real*8, dimension(1:nx, 1:ny) :: kh1, ho, hn
    real*8, dimension(1:nx, 1:ny) :: kh2, kh3, kh4
    
    ! time multiplier constants
    real*8, parameter :: dt6 = dt/6.0, dt2=dt*0.5
    
    ! Old values
    uo =  u(:,:,ts)
    vo =  v(:,:,ts)
    ho =  h(:,:,ts)
    
    !! RK4 method
    ! Call tendencies - RK4 step 1 of 4
    call solve(ku1, kv1, kh1, uo        , vo        , ho        )
    ! Call tendencies - RK4 step 2 of 4
    call solve(ku2, kv2, kh2, uo+ku1*dt2, vo+kv1*dt2, ho+kh1*dt2)
    ! Call tendencies - RK4 step 3 of 4
    call solve(ku3, kv3, kh3, uo+ku2*dt2, vo+kv2*dt2, ho+kh2*dt2)
    ! Call tendencies - RK4 step 4 of 4
    call solve(ku4, kv4, kh4, uo+ku3*dt , vo+kv3*dt , ho+kh3*dt )
    
    ! final step and time marching / new values for RK4
    un = uo + (ku1 + 2.0*ku2 + 2.0*ku3 + ku4)*dt6
    vn = vo + (kv1 + 2.0*kv2 + 2.0*kv3 + kv4)*dt6
    hn = ho + (kh1 + 2.0*kh2 + 2.0*kh3 + kh4)*dt6
    
    ! updating the data
    u(:,:,ts+1) = un
    v(:,:,ts+1) = vn
    h(:,:,ts+1) = hn

end subroutine rk4

subroutine solve(uout, vout, hout, uin, vin, hin)

    use params
    use model_vars
    
    implicit none
    
    ! input and output variables
    real*8, dimension(1:nx, 1:ny), intent( in) ::  uin,  vin,  hin
    real*8, dimension(1:nx, 1:ny), intent(out) :: uout, vout, hout
    
    ! iterating variables
    integer :: i2, j2
    
    ! Start , Stop Variables
    integer :: xb, xc, xf, yb, yc, yf
    
    ! Distance variables for gradient calculation
    real*8, parameter :: dx20 = 1.0/2.0*dx, dy20 = 1.0/2.0*dy
    
    ! Gravity multiplier constants for gradient terms
    real*8, parameter :: gdx20 = g*dx20, gdy20 = g*dy20
    
    ! diffusion multiplier constants for diffusion terms
    real*8, parameter :: nudxx = nu/(dx*dx), nudyy = nu/(dy*dy)
    
    ! Advection terms in the continuity and momentum equations
    real*8 :: hx, hy, ux, uy, vx, vy
    
    ! coriolis terms in momentum equations
    real*8 :: fu, fv
    
    ! Gravity/Pressure gradient terms in momentum equations
    real*8 :: gx, gy
    
    ! viscous drag terms in momentum equations
    real*8 :: bu, bv
    
    ! diffusion terms in momentum equations
    real*8 :: uxx, uyy, vxx, vyy
    
    do j2 = 1, ny
    
        call indices(j2, ny, yb, yc, yf)
    
        do i2 = 1, nx
        
            call indices(i2, nx, xb, xc, xf)
            
            ! hx term in continuity equation
            hx = ( hin(xf,yc)*uin(xf,yc) - hin(xb,yc)*uin(xb,yc) )*dx20
            
            ! hy term in continuity equation
            hy = ( hin(xc,yf)*vin(xc,yf) - hin(xc,yb)*vin(xc,yb) )*dy20
            
            ! ux term in x-momentum equation
            ux = uin(xc,yc)*(uin(xf,yc) - uin(xb,yc))*dx20
            
            ! uy term in x-momentum equation
            uy = vin(xc,yc)*(uin(xc,yf) - uin(xc,yb))*dy20
            
            ! vx term in x-momentum equation
            vx = uin(xc,yc)*(vin(xf,yc) - vin(xb,yc))*dx20
            
            ! vy term in x-momentum equation
            vy = vin(xc,yc)*(vin(xc,yf) - vin(xc,yb))*dy20
            
            ! fv term in x-momentum equation
            fv = f(xc,yc)*vin(xc,yc)
            
            ! fu term in y-momentum equation
            fu = f(xc,yc)*uin(xc,yc)
            
            ! ghx term in x-momentum equation
            gx = (hin(xf,yc) - hin(xb,yc))*gdx20
            
            ! ghy term in y-momentum equation
            gy = (hin(xc,yf) - hin(xc,yb))*gdy20
            
            ! bu term in x-momentum equation
            bu = vd*uin(xc,yc)
            
            ! bv term in y-momentum equation
            bv = vd*vin(xc,yc)
            
            ! uxx diffusion term in x-momentum equation
            uxx = (uin(xf,yc) - 2.0*uin(xc,yc) + uin(xb,yc))*nudxx
            
            ! uyy diffusion term in x-momentum equation
            uyy = (uin(xc,yf) - 2.0*uin(xc,yc) + uin(xc,yb))*nudyy
            
            ! vxx diffusion term in y-momentum equation
            vxx = (vin(xf,yc) - 2.0*vin(xc,yc) + vin(xb,yc))*nudxx
            
            ! uyy diffusion term in y-momentum equation
            vyy = (vin(xc,yf) - 2.0*vin(xc,yc) + vin(xc,yb))*nudyy
            
            ! Summing up all the terms in continuity equation
            hout(i2,j2) = - ( hx + hy )
            
            ! Summing up all the terms in x-momentum equation
            uout(i2,j2) = - ( ux + uy ) + fv - gx - bu + ( uxx + uyy )
            
            ! Summing up all the terms in y-momentum equation
            vout(i2,j2) = - ( vx + vy ) - fu - gy - bv + ( vxx + vyy )
        
        end do
    
    end do

end subroutine solve

subroutine indices(i2, nx, xb, xc, xf)

    implicit none
    integer, intent(in)  :: i2, nx
    integer, intent(out) :: xb, xc, xf
    
    if(i2 == 1) then
        xb = nx
        xc = i2
        xf = i2+1
    else if(i2 == nx) then
        xb = i2-1
        xc = i2
        xf =    1
    else
        xb = i2-1
        xc = i2
        xf = i2+1
    end if

end subroutine indices
