! Program to solve the Linear Advection Equation via Runge Kutta 4
! SI c = 2.0 m/s l = 1000 m t = 1000 s

program solver

    implicit none
    integer, parameter :: ts = 4001, sp = 1001
    real*8, dimension(1:ts,1:sp) :: u
    real*8, dimension(1:sp) :: ud, k1, k2, k3, k4, x
    real*8, parameter :: c = 2.0, l = 1000.0, pi = 4*atan(1.0), t = 1000.0
    real*8 :: dx, dt
    integer :: i, j
    character*20 :: frame, data1, plt
    !character*30 :: path1, path2, path3, pltcall
    
    dx = l/real(sp-1)
    dt = t/real(ts-1)

    print *, "The CFL is:", c*dt/dx
    
    x(1:sp) = [((dx*(i-1)), i=1,sp)]
    u(1,1:sp) = [(sin(2*pi*x(i)/l), i=1,sp)]
    
    k1 = 0
    k2 = 0
    k3 = 0
    k4 = 0
    
    10 format(f25.15, 5x, f25.15)
    !folder1 = "frames/"
    !folder2 = "data/"
    !folder3 = "path/"
    
    !call system("mkdir frames")
    !call system("mkdir data")
    !call system("mkdir path")
    
    do i=2,ts
    
        ud = u(i-1,:)
        u(i,1) = u(i-1,sp-1)
        
        call sub_lae_rk4(c,k1,ud,dx,dt,sp)
        call sub_lae_rk4(c,k2,ud+k1/2.0,dx,dt,sp)
        call sub_lae_rk4(c,k3,ud+k2/2.0,dx,dt,sp)
        call sub_lae_rk4(c,k4,ud+k3/2.0,dx,dt,sp)
        
!        call sub_lae_rk4(k1,ud,sp)
!        call sub_lae_rk4(k2,ud+k1/2.0,sp)
!        call sub_lae_rk4(k3,ud+k2/2.0,sp)
!        call sub_lae_rk4(k4,ud+k3/2.0,sp)
        
        u(i,:) = ud + (k1+2.0*k2+2.0*k3+k4)/(6.0)
        u(i,1) = u(i-1,sp)
        
        write(frame,'(a,i5.5,a)'),'plot',i,'.png'
        write(data1,'(a,i5.5,a)'),'data',i,'.txt'
        write(plt,'(a,i5.5,a)'),'gnuplt',i,'.gnu'
        !write(path1,'(a)'),trim(folder1)//trim(frame)
        !write(path2,'(a)'),trim(folder2)//trim(data1)
        !write(path3,'(a)'),trim(folder3)//trim(plt)
        !write(pltcall,'(a)'),"gnuplot "//trim(plt)
        
        !print *, trim(path1),' ',trim(path2)
        !print *, trim(path3)
        !print *, trim(pltcall)
        
        !open(unit = 1, file = path2)
        open(unit = 1, file = data1)
        do j = 1,sp
            write(unit=1,fmt=10),x(j),u(i,j)
        end do
        close(unit=1)
        
        open(unit = 2, file = plt)
        
        write(2,'(a)'), 'set terminal pngcairo transparent enhanced &
        & font "Arial,10" fontscale 1.0 size 500, 300'
        write(2,'(a)'), '# type, font size, a magnification ratio, &
        & and the size of the plot lxb in pixels'
        write(2,'(a)'), '# Sets a specific terminal and its colour &
        & properties, next, it sets a font'
        write(2,'(a)'), '# type, font size, a magnification ratio, &
        & and the size of the plot lxb in pixels'
        !write(2,'(a)'), 'set output "',trim(path1),'"' 
        write(2,'(a)'), 'set output "'//trim(frame)//'"' 
        write(2,'(a)'), '# Saves the plot on system with a name'       
        write(2,'(a)'), "set title 'LAE with sine function advected'&
        &               # Title of the plot"
        write(2,'(a)'), "set xlabel 'X axis'      &
        &              # Name of the x axis and below y axis"
        write(2,'(a)'), "set ylabel 'Y axis'"
        write(2,'(a)'), "set grid 'on'              &
        &                     # Displays grid"
        write(2,'(a)'), "set autoscale         &
        &               # scale axes automatically"
        write(2,'(a)'), "unset log         &
        &                     # remove any log-scaling"
        write(2,'(a)'), "unset label            &
        &                # remove any previous labels"
        write(2,'(a)'), "set xtic auto    &
        &                      # set xtics automatically"
        write(2,'(a)'), "set ytic auto          &
        &                # set ytics automatically"
        write(2,'(a)'), "set xr [0.0:2*pi]         &
        &           # Sets range in x axis"
        write(2,'(a)'), "set yr [-1:1]             &
        &            # Sets range in y axis"
        write(2,'(a)'), "set key on                 &
        &              # Sets the key on"
        write(2,'(a)'), 'plot "'//trim(data1)//'" using data 1:2 with &
        & linespoints ls 6 lc 7'
        write(2,'(a)'), '#The above line plots the points and &
        & connects them with lines'
        write(2,'(a)'), '#the line points are of line style 6 & 
        & and line colour is 7'
        close(unit = 2)
        
        call system("gnuplot "//trim(plt))
        
    end do
    call system("ffmpeg -framerate 10 -i *.png -s:v 1280x720 -c:v libx264 &
& -profile:v high -crf 20 -pix_fmt yuv420p daimler_man.mp4")
    !call system("rmdir -rf frames")
    !call system("rmdir -rf data")
    !call system("rmdir -rf path")

end program solver

! RK4 subroutine for LAE

subroutine sub_lae_rk4(c, k, u, dx, dt, sh)
!subroutine sub_lae_rk4(k, u, sh)

    implicit none
    integer, intent(in) :: sh
    real*8, intent(in), dimension(sh) :: u
    real*8, intent(inout), dimension(sh) :: k
    real*8, intent(in) :: c, dx, dt
    integer :: i
    
    !sh = size(u)
    !k(1) = u(sh)
    
    k(2:sh) = [(-c*dt*(u(i)-u(i-1))/dx, i = 2,sh)]
    !k(2:sh) = [( u(i)-u(i-1), i = 2,sh)]

end subroutine sub_lae_rk4
