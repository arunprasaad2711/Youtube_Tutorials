! Function program

real function func(x,c)

    implicit none
    real, intent(in) :: x,c
    
    func = sin(x) + x*c

end function func
