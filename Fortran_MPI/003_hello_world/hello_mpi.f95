! Hello World Program in Fortran using MPI

! Some rule of thumbs
! * Write MPI Subroutines/Variables in UPPERCASE, Fortran subroutines/variables in lowercase
!		- user preference

program hello_mpi

	! Include MPI Module
	use mpi
	
	implicit none
	
	! Data declarations for MPI
	integer :: ierr 	! error signal variable. Standard Value = 0
	integer :: rank		! process ID (pid) / Number
	integer :: nprocs	! number of processes
	
	! Initialize MPI
	! Initializer subroutine
	call MPI_INIT(ierr)
	
	! Setup Communicator Size
	! variable order : Communicator, number of processes, ierr
	call MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
	
	! Setup Ranks/IDs for each process
	! variable order : Communicator, rank/pid variable, ierr
	call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
	
	! type the main code
	print *, "Hello world! I am process ", rank, "of ", nprocs, "Process(es)"
	
	! Finalize MPI
	! Finalizer subroutine
	call MPI_FINALIZE(ierr)

end program hello_mpi
