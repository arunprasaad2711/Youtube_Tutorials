! Program to use and demonstrate global variables, gnuplot animation
! and linear advection equation solving using forward time backward
! space finite difference scheme

module global

    implicit none
    save
    integer, parameter :: rmax = 1000, cmax = 1000
    real*8, dimension(0:rmax,0:cmax) :: u = 0
    real*8, dimension(0:rmax) :: x

end module global

program lae

    use global
    implicit none
    real*8, parameter :: pi = 4.0*atan(1.0)
    real*8 :: l = 1000.0, c = 2.0, t = 1000.0, t1
    real*8 :: CFL, dt = 1.0, dx = 4.0
    integer :: ts, ss, tp, sp
    
    sp = int(l/dx)
    tp = int(t/dt)
    
    cfl = c*dt/dx
    
10  format(f30.10, 5x, f30.10)
    
    x(0:sp) = [(ss*dx, ss=0,sp)]
    u(0,0:sp) = [(sin(ss*2*pi*dx/l), ss=0,sp)]
    
    do ts = 1, tp
        t1 = u(ts-1,sp)
        do ss = 1, sp
            u(ts,ss) = u(ts-1,ss)*(1-cfl) +  cfl*u(ts-1,ss-1)
        end do
        u(ts, 0) = t1
    end do
    
    do ts = 0, tp
        open(unit = 1, file = "data.txt")
        do ss = 0, sp
            write(unit=1,fmt=10), x(ss), u(ts, ss)
        end do
        close(unit = 1)
        call system("gnuplot plot_lae.gnu")
        !call system("rm *.txt")
    end do
    
end program lae
