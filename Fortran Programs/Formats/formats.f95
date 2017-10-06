! Program to represent format specifications for print and read 
! statements

program formats

    implicit none
    integer :: a
    real :: ar, br
    character*10 :: ac
    
    !read 5, a,ar,br
    read '(i6,f8.3,e12.5)', a,ar,br
    read '(A10)', ac
    !5 format(i6,f8.3,e12.5)
    
    10 format("With formatting",i5,4X,f6.2,4x,e13.6)
    
    print 10, a,ar,br
    !print 5, a,ar,br
    !print *, "Without formatting", a, ar, br
    
    print '("With formatting", i5,4X,f6.2,4x,e13.6)', a,ar,br
    print '(A10)', ac
    
    !Format rules
    !eg i5
    !i = integer 5 = it is a 5 blocks/space field
    ! -2135 = 5 blocks/space field
    !eg f6.2
    !f = real numbers  6 stands for total blocks in field
    !2 = mandatory number of decimal places
    ! -21.45 real number. having 6 blocks, with 2 mandatory decimal 
    !places
    !eg e12.5
    ! e = exponent notation 12 = total no. of blocks
    ! 5 = minimum no. of significant digits
    !eg: 4X
    ! X = free space
    ! 4 = number of blocks
    !eg: A10
    ! A = character/string
    ! 10 = number of spaces in the field
    
end program formats
