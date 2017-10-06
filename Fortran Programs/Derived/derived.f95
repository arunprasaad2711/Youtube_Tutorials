! Program to show how derived data types work
! Derived Data types are similar to structures in C, C++

module deri

    implicit none
    save
    type prof
        integer :: id_no = 2
        character :: name1*20 = "Prof X"
    end type prof

end module deri

program derived

    use deri
    implicit none
    
    type stud
        integer :: id_no
        character :: name1*20
    end type stud
    
    character :: prof_name1*20 = "Professor1", stud_name1*20 = "Student1"
    character :: prof_name2*20 = "Professor2", stud_name2*20 = "Student2"
    character :: prof_name3*20 = "Professor3", stud_name3*20 = "Student3"
    
    integer :: prof_id1 = 21, stud_id1 = 31
    integer :: prof_id2 = 22, stud_id2 = 32
    integer :: prof_id3 = 23, stud_id3 = 33
    
    type(stud) :: stud1
    type(prof) :: prof1
    type(prof), dimension(2) :: prof2
    type(stud), dimension(2) :: stud2
    
    call deri_print(prof1, prof2)
    
    stud1%id_no = stud_id1
    stud2(1)%id_no = stud_id2
    stud2(2)%id_no = stud_id3
    
    prof1%id_no = prof_id1
    prof2(1)%id_no = prof_id2
    prof2(2)%id_no = prof_id3
    
    stud1%name1 = stud_name1
    stud2(1)%name1 = stud_name2
    stud2(2)%name1 = stud_name3
    
    prof1%name1 = prof_name1
    prof2(1)%name1 = prof_name2
    prof2(2)%name1 = prof_name3
    
    print *, "The student id in derived type stud1 is:",stud1%id_no
    print *, "The student id in derived type stud2 is:",stud2(1)%id_no
    print *, "The student id in derived type stud3 is:",stud2(2)%id_no

    print *, "The student name in derived type stud1 is:",stud1%name1
    print *, "The student name in derived type stud2 is:",stud2(1)%name1
    print *, "The student name in derived type stud3 is:",stud2(2)%name1
    
    call deri_print(prof1, prof2)
    
end program derived

subroutine deri_print(p1, p2)

    use deri
    implicit none
    
    type(prof), intent(in) :: p1
    type(prof), dimension(2), intent(in) :: p2
    
    print *, "The professor id in derived type stud1 is:",p1%id_no
    print *, "The professor id in derived type stud2 is:",p2(1)%id_no
    print *, "The professor id in derived type stud3 is:",p2(2)%id_no

    print *, "The professor name in derived type stud1 is:",p1%name1
    print *, "The professor name in derived type stud2 is:",p2(1)%name1
    print *, "The professor name in derived type stud3 is:",p2(2)%name1
    
end subroutine deri_print
