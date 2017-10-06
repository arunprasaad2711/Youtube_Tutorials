! Program for procedure 

module hello1
        
    implicit none
    
    contains
    
    subroutine hello
    
        implicit none
        print *, "Hello"
    
    end subroutine hello
    
end module hello1

program demo1

    use hello1
    implicit none
    integer :: i = 1
    
    print *, "i = ",i
    call hello

end program demo1
