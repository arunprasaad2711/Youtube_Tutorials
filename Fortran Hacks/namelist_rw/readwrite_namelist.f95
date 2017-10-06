! Program to read data to a namelist and write the namelist to a new file

program namelist_rw

    implicit none
    
    ! Defining file names
    !character (len=80) :: nml_r_filename='namelist_read.txt'
    character (len=80) :: nml_r_filename='namelist_sample'
    character (len=80) :: nml_w_filename='namelist_write.txt'
    
    ! Defining variables to read data
    integer :: year, age
    character (len=10) :: month , day , my_name, eye_colour
    logical :: student
    real*8 :: pizza_cost
    real*8, dimension(10) :: test_scores
    complex :: rpi
    
    ! Namelist Definition
    namelist /list1/     &
    
    &   year,            &
    &   month,           &
    &   age,             &
    &   pizza_cost,      &
    &   student,         &
    &   test_scores,     &
    &   my_name,         &
    &   rpi,             &
    &   day,             &
    &   eye_colour
    
    ! Reading from a file
    open(10,file=nml_r_filename,form='formatted',status='old')
    read(10, nml = list1)
    close(10)
    
    print *, "Year = ", year
    print *, "Age = ", age
    print *, "Month = ", month
    print *, "Day = ", day
    print *, "My Name = ", my_name
    print *, "Eye Colour = ", eye_colour
    print *, "Am I a Student? ", student
    print *, "Cost of a Pizza I ordered in Rupees : ", pizza_cost
    print *, "A Complex Number : ", rpi
    print *, "Some random test scores :", test_scores
    
    ! Writing to a file
    open(20,file=nml_w_filename,form='formatted',status='replace')
    write(20, nml = list1)
    close(20)
    
end program namelist_rw
