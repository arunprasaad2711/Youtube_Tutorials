! Program to send data back and forth between all processes as a ping-pong game!

! Objective: 
!	Setup a data value in process 0 and send it to process 1
!	Receive the data in process 1 and modify it, print it and send it to process 2
!	Repeat this till process nprocs-1 and there, terminate it!

! Advantage/purpose
!	To check if all the processors are working and communicating fine!

! Other variants
!	Pass data from rank 0 to n-1 through other processes. After reaching rank n-1, send data to rank = 0.
! 	Repeat above for multiple rounds!

! Note: non-master processes (pid or rank > 0) are sometimes called slave processes
!		process with pid or rank = 0 is the master process

program send_recv

	! Include MPI Module
	use mpi
	implicit none
	
	! Data declarations for MPI
	integer :: ierr 	! error signal variable. Standard Value = 0
	integer :: rank		! process ID (pid) / Number
	integer :: nprocs	! number of processes
	
	! status variable - tells the status of send/receive calls
	! Needed for receive subroutine
	integer, dimension(MPI_STATUS_SIZE) :: status1
	
	! variables for neighbouring processes
	integer :: left = 0, centre = 0, right = 0
	
	! Test data: ping - data to send, pong - data to receive
	integer :: ping, pong
	
	! Initialize MPI
	call MPI_INIT(ierr)
	
	! Setup Communicator Size
	call MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
	
	! Setup Ranks/IDs for each process
	call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
	
	! type your main code
	
	! setting up neighbouring processes
	left = rank - 1
	centre = rank
	right = rank + 1
	
	! Ping-Pong Game!
	if ( rank == 0 ) then
	
		! Set-up a ping value and proceed
		! ping = centre + 1
		ping = 66
		
		! Send/Ping the data
		! Syntax: call MPI_SEND(start_address, count, datatype, destination pid/rank, tag, communicator, ierr)
		call MPI_SEND(ping, 1, MPI_INT, right, centre, MPI_COMM_WORLD, ierr)
		print *, "Ping from Rank", rank, "ping = ", ping
	
	else if ( rank == nprocs - 1) then
	
		! Receive/Pong from process rank-1
		! syntax call MPI_RECV(start_address, count, datatype, source, tag, communicator, status, ierr)
		call MPI_RECV(pong, 1, MPI_INT, left, left, MPI_COMM_WORLD, status1, ierr)
		print *, "Pong from Rank", rank, "pong = ", pong
	
	else
		
		! Receive/Pong from process rank-1
		! syntax call MPI_RECV(start_address, count, datatype, source, tag, communicator, status, ierr)
		call MPI_RECV(pong, 1, MPI_INT, left, left, MPI_COMM_WORLD, status1, ierr)
		! print *, "Pong from Rank", rank, "pong = ", pong
		
		! modify the data
		! ping = pong + 1
		ping = pong
		
		! Send/Ping the data
		! Syntax: call MPI_SEND(start_address, count, datatype, destination pid/rank, tag, communicator, ierr)
		call MPI_SEND(ping, 1, MPI_INT, right, centre, MPI_COMM_WORLD, ierr)
		! print *, "Ping from Rank", rank, "ping = ", ping
		
	end if
	
	! Finalize MPI
	call MPI_FINALIZE(ierr)

end program send_recv
