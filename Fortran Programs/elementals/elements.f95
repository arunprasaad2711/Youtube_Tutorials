! Program to explain about elemental procedures

module elements1

    implicit none
    contains
    
    elemental subroutine ex_r(x,y)
    
        implicit none
        real, intent(inout) :: x, y
        real :: temp
        
        temp = x
        x = y
        y = temp
    
    end subroutine ex_r
    
    elemental subroutine ex_i(x,y)
    
        implicit none
        integer, intent(inout) :: x, y
        integer :: temp
        
        temp = x
        x = y
        y = temp
    
    end subroutine ex_i
    
    elemental subroutine ex_l(x,y)
    
        implicit none
        logical, intent(inout) :: x, y
        logical :: temp
        
        temp = x
        x = y
        y = temp
    
    end subroutine ex_l

end module elements1

module elements2

    use elements1
    implicit none
    
    interface exchange
        module procedure ex_r
        module procedure ex_i
        module procedure ex_l
    end interface exchange

end module elements2

program elements

    use elements2
    implicit none
    real :: ar = 5.0, br = 6.0
    real , dimension(10) :: ar1 = 5.0, br1 = 6.0
    integer :: ai = 5, bi = 6
    integer , dimension(10) :: ai1 = 5, bi1 = 6
    logical :: al = .true., bl = .false.
    logical , dimension(10) :: al1 = .true., bl1 = .false.
    
    print *, "Before Swapping:"
    print *, "ar = ",ar
    print *, "br = ",br
    print *, "ar1 = ",ar1
    print *, "br1 = ",br1
    
    call exchange(ar,br)
    call exchange(ar1, br1)
    
    print *, "After Swapping:"
    print *, "ar = ",ar
    print *, "br = ",br
    print *, "ar1 = ",ar1
    print *, "br1 = ",br1
    
    print *, "Before Swapping:"
    print *, "ai = ",ai
    print *, "bi = ",bi
    print *, "ai1 = ",ai1
    print *, "bi1 = ",bi1
    
    call exchange(ai,bi)
    call exchange(ai1, bi1)
    
    print *, "After Swapping:"
    print *, "ai = ",ai
    print *, "bi = ",bi
    print *, "ai1 = ",ai1
    print *, "bi1 = ",bi1
    
    print *, "Before Swapping:"
    print *, "al = ",al
    print *, "bl = ",bl
    print *, "al1 = ",al1
    print *, "bl1 = ",bl1
    
    call exchange(al,bl)
    call exchange(al1, bl1)
    
    print *, "After Swapping:"
    print *, "al = ",al
    print *, "bl = ",bl
    print *, "al1 = ",al1
    print *, "bl1 = ",bl1
    
end program elements
