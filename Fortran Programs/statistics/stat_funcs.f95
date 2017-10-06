! Module for defining statistical functions

module stat_funcs

    contains

    real*8 function mean1(x,n)

        implicit none
        integer, intent(in) :: n
        real*8, dimension(n), intent(in) :: x
        
        mean1 = sum(x)/real(n)
        
    end function mean1

    real*8 function vars1(x,n)

        implicit none
        integer, intent(in) :: n
        real*8, dimension(n), intent(in) :: x
        integer :: i
        
        vars1 = mean1([(x(i)**2, i=1,n)],n) - (mean1(x,n))**2

    end function vars1
    
    real*8 function stdev1(x,n)
    
        implicit none
        integer, intent(in) :: n
        real*8, intent(in), dimension(n) :: x
        
        stdev1 = (vars1(x,n))**0.5
    
    end function stdev1
    
    real*8 function cov_var12(x,y,n)
        
        implicit none
        integer, intent(in) :: n
        real*8, dimension(n), intent(in) :: x, y
        integer :: i
        
        cov_var12 = mean1([(x(i)*y(i), i=1,n)],n) - mean1(x,n)* &
        & mean1(y,n)
        
    end function cov_var12
    
    real*8 function corr_12(x,y,n)
    
        implicit none
        integer, intent(in) :: n
        real*8, intent(in), dimension(n) :: x, y
        
        corr_12 = cov_var12(x,y,n)/(stdev1(x,n)*stdev1(y,n))
    
    end function corr_12
    
    subroutine print_mat1(b,n)

        implicit none
        integer, intent(in) :: n
        real*8, dimension(n), intent(in) :: b
        integer :: i
    
        do i=1,n
            write(*,'("|",f8.3," |")',advance='yes'),b(i)
        end do

    end subroutine
    
end module stat_funcs
