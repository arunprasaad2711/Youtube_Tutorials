! Program to demonstrate advanced file options - Direct files

! Program to fetch student's data like roll no., name and grades

program files2

    implicit none
    integer, parameter :: u = 10, g=2
    integer :: roll, ios, grades(g), no, i, j, rno, f=0
    character :: stud_name*25
    
    open(unit = u, file = "stud_rec.txt", access = "direct", &
    recl = 43, iostat = ios, status = "replace", form = "formatted")
    
    ! Since the data is written in a specific format, the "form", "access" 
    ! and "recl" parameters are necessary/compulsory in the open statement.
    
    10 format(i4,3x,a25,3x,2i4)
    20 format(i4,3x,a25,3x,i2,3x,i2)
    print *, "Enter the number of entries:"
    read *, no
    
    do i=1,no
        print *, "Enter the roll number for student ", i, ":"
        read *, roll
        print *, "Enter the name for student ", i, ":"
        read *, stud_name
        print *, "Enter the grades for student ", i, ":"
        do j=1,g
            read *, grades(j)
        end do
        write(unit = u, fmt = 10, rec = roll), roll, stud_name, grades
    end do
    
    close(unit = u)
    
    print *, "Writing done!... Let's read data shall we?"
    
    rno = 10 ! roll no. of the data set which will be printed.
    
    open(unit = u, file = "stud_rec.txt", status = "old", & 
    iostat=ios, recl = 43, access = "direct", form = "formatted")
    
    ! Reading the data! It is a single line!
    read(unit = 10, fmt = 10, rec = rno),  roll, stud_name, grades
    if(roll == rno) then
        f = 1
        print *, "Roll no. found!"
        print *, "Roll no:",roll
        print *, "Name:",stud_name
        print *, "Grades:",grades
        print *, "Just like this, all the data can be extracted and printed!"
    end if
    
    if (f == 1) then
        f = 0
        print *, "Congratulations! Your data was retrieved!"
    else
        print *, "Sorry!, Data not available!"
    end if
    
    !! Apparantly, updating the file is distorting the data  !!
    !! Apparantly, this prevalied even after changing format !!
    !! Apparantly, this prevalied even after changing recl   !!
    
    print *, " Searching done!... Let's replace a data shall we?"
    
    rno = 5 ! Roll number data to be changed
    
    open(unit = u, file = "stud_rec.txt", status = "old", & 
    iostat=ios, recl = 43, access = "direct", form = "formatted")
    
    ! Reading the data! It is a single line!
    read(unit = 10, fmt = 10, rec = rno),  roll, stud_name, grades
    if(roll == rno) then
        f = 1
        print *, "Roll no. found!"
        print *, "Enter the roll number for student ", i, ":"
        read *, roll
        print *, "Enter the name for student ", i, ":"
        read *, stud_name
        print *, "Enter the grades for student ", i, ":"
        do j=1,g
            read *, grades(j)
        end do
        write(unit = u, fmt = 20, rec = roll), roll, stud_name, grades(1), grades(2)
    end if
    
    if (f == 1) then
        f = 0
        print *, "Congratulations! Your data was Modified!"
    else
        print *, "Sorry!, Some issue!"
    end if
    
end program files2

! inquire(unit=10, opened = op_status, name = file_name)
! sets op_status as .true. if the file name corresponding to unit = 10 is opened.
! Also, it returns the file name in the variable file_name associated with unit = 10.

! inquire(name = "file name", number = p, opened = op_status, exist = present)
! sets p as the unit number associated with the "file name". present is true if
! file is present.

! inquire(unit = "file name", access = access_type, recl = length)
! sets access_type to be either direct or sequential as per the case and the record
! length in length. Other specifiers can also be used.
