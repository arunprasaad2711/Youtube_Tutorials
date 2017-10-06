module fact1

contains

function fac_num(num,n)

    implicit none
    integer, intent(in) :: n
    integer*8, dimension(n), intent(in) :: num
    integer*8 :: i,j
    integer*8 :: fact
    integer*8, dimension(n) :: fac_num
    
    do i=1,n
        fact = 1
        do j=1,num(i)
            fact = fact*j
        end do
        fac_num(i) = fact
    end do

end function fac_num

end module fact1
