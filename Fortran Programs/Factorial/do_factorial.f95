#! /usr/bin/gfortran

! Successive Factorials using do loop

program do_fact

    implicit none
    
    ! n n! = n*(n-1)*(n-2)*(n-3)*....*3*2*1
    ! 6 6! = 6*5*4*3*2*1 = 720
    
    integer :: i, n, j, fact
    
    print *, "Enter a value for n"
    read *, n
    
    outer_do_loop: do i=1,n
        
        !print *, "Inside the loop, i = ",i
        fact = 1
        !i = 4 !Error
        j = 3   ! No error
        inner_do_loop: do j=1,i
            
            ! i = 1
            !j = 3 ! No Error
            fact = fact*j
        
        end do inner_do_loop
        
        print *, "The factorial of ", i, " is:", fact
        
    end do outer_do_loop
    
    !print *, "i = ",i
   
    
end program do_fact
