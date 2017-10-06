! Program for defining and printing strings

program strings

    implicit none

    !character :: a ! a can store just one character = symbol or a 1 digit 
                   ! number or a single alphabet
    !character (len=5) :: b ! b is a 5 character long string

    !character(5) :: b
    !character*5 :: b
    !character :: b*5

    !character :: c*6, d*10, e*3
    
    !array of strings declarations
    
    !character (len=6), dimension(2) :: str1 ! str1 will have two 
    !strings each of 6 characters in length
    
    !character (6), dimension(2) :: str1
    !character*6, dimension(2) :: str1  
    !character, dimension(2) :: str1*6!, str2*7, str3*10 

!    a = 'X'
!    !a = "X" ! Alternate expression
!    b = 'white'
!    c = "456321"
!    d = "asd567jk^%"
!    e = "_ _"

!    print *, "a = ",a
!    print *, "b = ",b
!    print *, "c = ",c
!    print *, "d = ",d
!    print *, "e = ",e

    print *, "My name is Arun, written in double quotes"
    print *, 'My name is Arun, written in single quotes'
    print *, "He is my friend's teacher"
    print *, 'He is my friend"s teacher'
    print *, 'My friend said, "I am fine!", and I moved on!'
    print *, "My friend said, 'I am fine!', and I moved on!"
    print *, "My friend said, ""I am fine!"", and I moved on!"
    print *, 'My friend said, ''I am fine!'', and I moved on!'

!    str1(1) = "Carrom"
!    str1(2) = 'Cod ng'
    
!    ! read *, str1(1), str1(2)
    
!    print *, "First string: ", str1(1), " Second string: ", str1(2) 
    

end program strings
