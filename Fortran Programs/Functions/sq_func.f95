! Function definition to calculate the area of a square

real*8 function sq(s)

    implicit none
    real*8, intent(in) :: s
    
    print *, "The side of the square is:",s
    
    sq = s*s

end function sq
