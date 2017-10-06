! Sample module for assisting gauss elimination

module gel1

    contains
    
    recursive real*8 function detf(mat, n) result(det)

        implicit none
        integer, intent(in) :: n
        real*8, intent(in), dimension(n,n) :: mat
        real*8, dimension(n-1,n-1) :: sl
        integer :: i
        
        det = 0
        
        if (n == 1) then
            det = mat(1,1)
        else
            do i = 1,n
                call slicef(sl,mat,n,1,i)
                det = det + ((-1.0)**(1+i))*mat(1,i)*detf(sl,n-1)
            end do
        end if

    end function detf
    
    function get_iden(n)

        implicit none
        integer, intent(in) :: n
        integer :: i
        real*8, dimension(n,n) :: get_iden
        
        get_iden = 0
        
        do i=1,n
            get_iden(i,i) = 1.0
        end do

    end function get_iden
    
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

    subroutine print_mat1(b,n)

        implicit none
        integer, intent(in) :: n
        real*8, dimension(n), intent(in) :: b
        integer :: i
        
        do i=1,n
            write(*,'("|",f8.3," |")',advance='yes'),b(i)
        end do

    end subroutine

    function get_ab(a,b,n)

        implicit none
        integer, intent(in) :: n
        integer :: i,j
        real*8, dimension(n,n), intent(in) :: a
        real*8, dimension(n), intent(in) :: b
        real*8, dimension(n,n+1) :: get_ab
        
        do i=1,n
            do j=1,n+1
                if(j<=n) then
                    get_ab(i,j) = a(i,j)
                else
                    get_ab(i,j) = b(i)
                end if
            end do
        end do

    end function get_ab
    
    subroutine slicef(sl, mat, n, row, column)

        implicit none
        integer, intent(in) :: n,row,column
        real*8, dimension(n,n), intent(in) :: mat
        real*8, dimension(n-1,n-1), intent(out) :: sl
        logical, dimension(n,n) :: mask
        
        mask = .true.
        mask(row,:) = .false.
        mask(:,column) = .false.
        
        sl = reshape(pack(mat,mask),(/n-1,n-1/))

    end subroutine slicef

end module gel1
