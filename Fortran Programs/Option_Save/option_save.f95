! Program to explain optional parameters and save function

module fact1

    implicit none
    integer :: counter
    save
    
    contains
    
    recursive integer*8 function fact(n,c) result(f1)
    
        implicit none
        integer*8, intent(in) :: n
        integer, intent(in), optional :: c
        
        counter = counter + 1
        
        if(n<=1) then
            if(present(c)) then
                print *, "n value is:",n
            end if
            f1 = 1
            return
        else
            if(present(c)) then
                print *, "n value is:",n
            end if
            f1 = fact(n-1,c)
            f1 = f1*n
            return
        end if
    
    end function fact

end module fact1

program facto

    use fact1
    implicit none
    integer*8 :: n, nf, i
    
    counter = 0
    
    print *, "Enter the value of n"
    read *, n
    
    do i=1,n
        nf = fact(i,1)
        print *, "The value of ",i,"! is = ",nf
    end do
    
    print *, "The total number of function calls:",counter

end program facto
