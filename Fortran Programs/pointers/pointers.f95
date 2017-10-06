! Program to demonstrate pointers
! A pointer can point to only one variable
! A variable can have many pointers
! Variables with "target" key word alone can be pointed

module points

    implicit none
    
    type s_lin_list
        character :: var
        type(s_lin_list), pointer :: pt
    end type s_lin_list
    
    type d_lin_list
        character :: var
        type(d_lin_list), pointer :: left, right
    end type d_lin_list

end module points

program pointers

    use points
    implicit none
    integer, target :: x1 = 10, x2 = 25
    integer, target :: x3
    integer :: x4 = 100
    integer, pointer :: p1, p2, p3, p4
    real, dimension(10, 10, 10), target :: r1 = 8.0
    real, dimension(:,:,:), pointer :: pt_r1
    
    print *, "Before Nullification!"
    write(*,*)
    
    p1=>x1
    p2=>x2
    p3=>x3
    ! p4=>x4 !not possible
    !p4=>p3 ! a pointer can point to another pointer! So, this is valid
    p4=>x3
    pt_r1=>r1
    
    p4 = 5
    print *, "x3 = ",x3
    print *, "p3 = ",p3
    print *, "p4 = ",p4
    p3 = 255 ! over-writing the value of x3
    
    print *, "x1 = ",x1
    print *, "p1 = ",p1
    
    print *, "x2 = ",x2
    print *, "p2 = ",p2
    
    print *, "x3 = ",x3
    print *, "p3 = ",p3
    print *, "p4 = ",p4
    
    print *, "r1(1,1,6) = ",r1(1,1,6)
    print *, "pt_r1(1,1,6) = ",pt_r1(1,1,6)
    
    print *, "Association of p1",associated(p1)
    !print *, "Association of x1",associated(x1) ! Does not work
    print *, "Association of p2",associated(p2)
    print *, "Association of pt_r1",associated(pt_r1)
    write(*,*)
    print *, "Association of p1 and x1",associated(p1,x1)
    print *, "Association of p1 and x2",associated(p1,x2)
    print *, "Association of p2 and x1",associated(p2,x1)
    print *, "Association of p2 and x2",associated(p2,x2)
    write(*,*)
    print *, "Association of p3 and x3",associated(p3,x3)
    print *, "Association of p4 and x3",associated(p4,x3)
    print *, "Association of pt_r1 and r1",associated(pt_r1,r1)
    
    nullify(p2)
    nullify(pt_r1)
    
    write(*,*)
    print *, "After Nullification!"
    write(*,*)
    print *, "x1 = ",x1
    print *, "x2 = ",x2
    print *, "p1 = ",p1
    print *, "p2 = ",p2
    print *, "r1(1,1,6) = ",r1(1,1,6)
    !print *, "pt_r1(1,1,6) = ",pt_r1(1,1,6)
    print *, "Association of p1",associated(p1)
    print *, "Association of p2",associated(p2)
    print *, "Association of pt_r1",associated(pt_r1)
    write(*,*)
    print *, "Association of p1 and x1",associated(p1,x1)
    print *, "Association of p1 and x2",associated(p1,x2)
    print *, "Association of p2 and x1",associated(p2,x1)
    print *, "Association of p2 and x2",associated(p2,x2)
    print *, "Association of pt_r1 and r1",associated(pt_r1,r1)
    
end program pointers
