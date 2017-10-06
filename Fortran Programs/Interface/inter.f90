! Program to explain interfacing of functions and subroutines
! Geometric Progression is used for function interfacing!
! Swapping of variables is used for subroutine interfacing!

real function geo_term_real(a0,r,n) result(an)

    implicit none
    integer, intent(in) :: n
    real, intent(in) :: a0, r
    real :: ac
    
    an = a0*r**n
    ac = 2*an
    print *, "ac = ",ac
    an = 0.5*ac
    
    return
    
end function geo_term_real

integer function geo_term_int(a0,r,n) result(an)
    
    implicit none
    integer, intent(in) :: n
    integer, intent(in) :: a0, r
    
    an = a0*r**n
    
    return
    
end function geo_term_int

subroutine swap_int(a, b)

    implicit none
    integer, intent(inout) :: a, b
    integer :: c
    
    c = a
    a = b
    b = c

end subroutine swap_int

subroutine swap_real(a, b)

    implicit none
    real, intent(inout) :: a, b
    real :: c
    
    c = a
    a = b
    b = c

end subroutine swap_real

program inter

    implicit none
    integer :: aa0 = 1, ar = 2, n = 6, aan
    real :: ga0 = 1.0, gr = 1.0, gan
    
    integer :: sia = 4, sib = 5
    real :: sra = 4.0, srb = 5.0
    
    interface geo_term
    
        integer function geo_term_int(a0,r,n) result(an)
        
            implicit none
            integer, intent(in) :: n
            integer, intent(in) :: a0, r
            
        end function geo_term_int
        
        real function geo_term_real(a0,r,n) result(an)
            
            implicit none
            integer, intent(in) :: n
            real, intent(in) :: a0, r
            
        end function geo_term_real
        
    end interface geo_term
    
    interface swap
    
        subroutine swap_real(a, b)

            implicit none
            real, intent(inout) :: a, b
            real :: c
            
        end subroutine swap_real
        
        subroutine swap_int(a, b)

            implicit none
            integer, intent(inout) :: a, b
            integer :: c
            
        end subroutine swap_int
    
    end interface swap
    
    aan = geo_term(aa0, ar, n)
    gan = geo_term(ga0, gr, n)
    
    print *, "n = ",n
    
    print *, "aa0 = ",aa0
    print *, "ar = ",ar
    print *, "aan = ",aan
    
    print *, "ga0 = ",ga0
    print *, "gr = ",gr
    print *, "gan = ",gan
    
    print *, "Integer Swapping:"
    
    print *, "Before Swapping:"
    print *, "sia = ",sia
    print *, "sib = ",sib
    
    call swap(sia, sib)
    
    print *, "After Swapping:"
    print *, "sia = ",sia
    print *, "sib = ",sib
    
    print *, "Float Swapping:"
    
    print *, "Before Swapping:"
    print *, "sra = ",sra
    print *, "srb = ",srb
    
    call swap(sra, srb)
    
    print *, "After Swapping:"
    print *, "sra = ",sra
    print *, "srb = ",srb
    
end program inter
