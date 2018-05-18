! Program to broadcast data from processes

! Motivation
! 	Let one process alone do work and later, let all other processes get data

! Advantage
!	Reduced computation (provided processing > communication)

! Caution:
!	Let the MPI_BCAST be outside the if construct for the
!		process that broadcasts! Otherwise, program freezes.
!   If master process is used, then data is not broadcasted.
!		Although the program does not freeze!

program bcast

	! Include MPI Module
	use mpi
	implicit none
	
	! Data declarations for MPI
	integer :: ierr 	! error signal variable. Standard Value = 0
	integer :: rank		! process ID (pid) / Number
	integer :: nprocs	! number of processes
	
	! data for broadcasting
	integer :: x1 = 0
	
	! rank that will broadcast
	integer :: choice = 0
	
	! Initialize MPI
	call MPI_INIT(ierr)
	
	! Setup Communicator Size
	call MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
	
	! Setup Ranks/IDs for each process
	call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
	
	! type your main code
	
	! Print the data
	print *, "Before Broadcast, Rank, data = ", rank, x1
	
	! Broadcasting process modifies data
	if ( rank == choice ) then
		x1 = (rank + 2)**2
		
		! Do not write it here! Program Hangs!
		! If master process is used, then data is not broadcasted.
		! call MPI_BCAST(x1, 1, MPI_INT, choice, MPI_COMM_WORLD, ierr)
	end if
	
	! Broadcasting process broadcasts data
	! syntax: call MPI_BCAST(start, count, datatype, root, comm, ierr)
	call MPI_BCAST(x1, 1, MPI_INT, choice, MPI_COMM_WORLD, ierr)
	
	if ( rank == choice ) then
		print *, " Rank = ", choice, "broadcasted data"
	end if
	
	! Print the data
	print *, "After Broadcast, Rank, data = ", rank, x1
	
	! Finalize MPI
	call MPI_FINALIZE(ierr)

end program bcast
