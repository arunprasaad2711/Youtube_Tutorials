! Program to explain why to use save keyword in detail

module fact2

    implicit none
    
    contains
    
    recursive integer*8 function fact(n,debug) result(f1)
    
        implicit none
        integer :: counter = 0
        integer*8, intent(in) :: n
        integer*8, intent(in), optional :: debug
        save counter
        
        counter = counter + 1
        print *, "Counter = ",counter
        
        if(n<=1) then
            if(present(debug) .and. debug == 1) then
                print *, "n value is:",n
            end if
            f1 = 1
            return
        else
            if(present(debug) .and. debug == 1) then
                print *, "n value is:",n
                f1 = fact(n-1,debug)
                f1 = f1*n
                return
            end if
            f1 = fact(n-1)
            f1 = f1*n
            return
        end if
    
    end function fact

end module fact2

program save_ex

    use fact2
    implicit none
    integer*8 :: debug = 1
    integer*8 :: n, nf, i
    
    print *, "Enter the value of n"
    read *, n
    
    do i=1,n
        nf = fact(i,debug)
        print *, "The value of ",i,"! is = ",nf
    end do

end program save_ex
