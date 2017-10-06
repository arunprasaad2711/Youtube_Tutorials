! A sample subroutine for f2py

subroutine add1(r, c, a)

    implicit none
    integer(kind=8),  intent(in) :: r, c
    integer(kind=8), intent(inout), dimension(r,c) :: a
    
    a = a + 1 

end subroutine add1
