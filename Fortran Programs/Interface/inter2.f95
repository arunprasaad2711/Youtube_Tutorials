! Program to explain module function/subroutine interfacing
! A module cannot have the interface block for it's own procedures!
! It can have interface procedures for other module's procedures if
! they are imported using "use" keyword.

! Alternatively, the module to be used with interfacing, can be directly
! invoked into the program, and the interfacing blocks have to be 
! inside the program definition.

! A module cannot have an interface block for it's own procedures!

module inters

    implicit none

!    interface swap
!        module procedure swap_int
!        module procedure swap_real
!    end interface swap
    
!    interface geo_term
!        module procedure geo_term_int
!        module procedure geo_term_real
!    end interface geo_term

    contains
    
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
    
end module inters

module inters2

    use inters
    implicit none
    
    interface swap
        module procedure swap_int
        module procedure swap_real
    end interface swap
    
    interface geo_term
        module procedure geo_term_int
        module procedure geo_term_real
    end interface geo_term
    
end module inters2

program inter2

    use inters2
    implicit none
    
!    interface swap
!        module procedure swap_int
!        module procedure swap_real
!    end interface swap
    
!    interface geo_term
!        module procedure geo_term_int
!        module procedure geo_term_real
!    end interface geo_term
    
    integer :: aa0 = 1, ar = 2, n = 6, aan
    real :: ga0 = 1.0, gr = 1.0, gan
    
    integer :: sia = 4, sib = 5
    real :: sra = 4.0, srb = 5.0
    
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

end program inter2
