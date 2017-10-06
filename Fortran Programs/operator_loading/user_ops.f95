! Program to make used defined operators and operator overloading
! Operators that have a pre-defined "operation" assigned to it can be 
! assigned a new operation based on the data types. Derived data types
! are of help here. Creating new data types do not have much issue.

! What you need:
! For Defining a new operator:
!    0. An interface block
!    1. An operator symbol
!    2. A function or a subroutine to do the operation
! For defining a new operation to an already existing operator:
!    0. An interface block
!    1. A derived data type
!    2. A function or a subroutine to do the operation

module new_ops

    implicit none
    
    type sp
        integer :: vals
    end type sp
    
    interface operator(*)
        module procedure new_mul
    end interface
    
    interface operator(+)
        module procedure new_add
    end interface
    
    interface operator(.dot.)
        module procedure vec_dot_prod
    end interface
    
    contains
        
        function new_mul(a,b) result(c)
        
            implicit none
            type(sp) , intent(in) :: a, b
            type(sp) :: c
            
            c%vals = a%vals*b%vals + 3 
            
        end function new_mul
        
        function new_add(a, b) result(c)
        
            implicit none
            type(sp), intent(in) :: a,b
            type(sp) :: c
            
            c%vals = a%vals+b%vals + 3
        
        end function new_add
        
        real*8 function vec_dot_prod(a, b) result(dp)
        
            implicit none
            real*8, dimension(:), intent(in) :: a, b
            
            dp = dot_product(a, b)
        
        end function vec_dot_prod
        
end module new_ops

program ops

    use new_ops
    implicit none
    integer, parameter :: n = 4
    integer :: a, b, apb, amb
    type(sp) :: a1, b1, apb2, amb2
    real*8, dimension(n) :: v1, v2
    real*8 :: dp
    
    a = 5
    b = 6
    
    apb = a + b
    amb = a * b
    
    print *, "Normal Operations:"
    print *, "Value a:"
    print *, a
    print *, "Value b:"
    print *, b
    print *, "Value a+b:"
    print *, apb
    print *, "Value a*b:"
    print *, amb
    
    a1%vals = 5
    b1%vals = 6
    
    apb2 = a1 + b1
    amb2 = a1 * b1
    
    print *, "Overloaded Operations"
    print *, "Value a1:"
    print *, a1%vals
    print *, "Value b1:"
    print *, b1%vals
    print *, "Value a1+b1:"
    print *, apb2%vals
    print *, "Value a2*b2:"
    print *, amb2%vals
    
    v1 = 1.0
    v2 = 1.0
    
    dp = v1.dot.v2
    
    print *, "User Defined Operation - Vector Dot Product"
    print *, "Vector v1:"
    print *, v1
    print *, "Vector v2:"
    print *, v2
    print *, "Vector Product via operator:"
    print *, dp
    
end program ops
