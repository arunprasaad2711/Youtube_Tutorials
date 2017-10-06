! Program to demonstrate some string operations
! Useful for managing file names and other string works

program strs

    implicit none
    character :: name1*10 = " Fortran ", name2*10="C++", name6*10
    character :: name3*20, name4*20, name5*10 = " String s "
    
    10 format("Name ",i1," is:",A10," Name ",i1," is:",A10,"_Check")
    20 format("Name 3 is:",A20," Name 4 is:",A20)
    
    print 10, 1,name1,2,name2
    
    name3 = name1//name2
    name4 = trim(name1)//trim(name2)
    name6 = adjustl(name5)
    
    print 20, name3,name4
    
    print 10, 5,name5,6,name6
    print *, "length of string is:",len(" String s")
    print *, name1
    print *, name1(:6)
    print *, name1(6:)
    print *, name1(4:7)

end program strs
