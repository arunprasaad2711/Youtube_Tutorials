! Program to check for matrix slicing

program mat_slice

    implicit none
    real*8, dimension(3,3) :: mat
    real*8, dimension(2,2) :: slice
    logical, dimension(3,3) :: mask
    !real*8, dimension(4) :: temp
    integer :: i=3,j=3
    
    !mat(1,1) = 4
    !mat(2,1) = 3
    !.....
        
    mat = reshape((/1,2,3,4,5,6,7,8,9/),(/3,3/))
    
    ! mat(1,1) = 1
    ! mat(2,1) = 4
    ! mat(3,1) = 7
    ! mat(1,2) = 2
    ! mat(2,2) = 5
    ! mat(3,2) = 8
    ! ....
    ! in this fortran array, the storage is like
    ! mat(1,1), mat(2,1), mat(3,1), mat(1,2) ....
    
    ! For a 3d array
    ! mat(1,1,1), mat(2,1,1), mat(3,1,1), mat(1,2,1),mat(2,2,1), 
    ! mat(3,2,1), ....
    
    mask = .true.
    mask(i,:) = .false.
    mask(:,j) = .false.
        
    slice = reshape(pack(mat,mask),(/2,2/))
    
    print *, "The Matrix is:"
    do i = 1,3
        do j = 1,3
            !print '("Mat(",i1,",",i1,") is = ",f10.3)',i,j,mat(i,j)
            !write(*,'("Mat(",i1,",",i1,") is = ",f10.3)',advance='no')&
            !& ,i,j,mat(i,j)
            write(*,'(f8.3,t3)',advance='no'),mat(i,j)
        end do
        !print *,new_line('AAc')
        write(*,*)
    end do
    
    print *, "The Sliced Matrix is:"
    do i = 1,2
        do j = 1,2
            !print '("Slice(",i1,",",i1,") is = ",f10.3)',i,j,slice(i,j)
            !write(*,'("Slice(",i1,",",i1,") is = ",f10.3)',advance='no')&
            !& ,i,j,slice(i,j)
            write(*,'(f8.3,t3)',advance='no'),slice(i,j)
        end do
        !print *,new_line('A')
        write(*,*)
    end do
    
    
    ! Column Based
    ! Mat
    ! 1 2
    ! 3 4
    ! (1,2,3,4) = Row Based storing eg: C, C++, Matlab
    ! (1,3,2,4) = Column Based storing eg: Fortran
	
end program mat_slice
