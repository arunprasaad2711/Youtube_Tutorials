! Program to explain the working of a subroutine

program sub_ex

    implicit none
    
    print *, "We are inside main program!"
    print *, "Calling Subroutine A!"
    call A
    print *, "We are back to the main program and exiting!"
    
    contains
    
    subroutine A

    implicit none
    
    print *, "We are inside Subroutine A!"
    print *, "Calling Subroutine B!"
    call B
    print *, "We are back to Subroutine A!"

end subroutine A


end program sub_ex
