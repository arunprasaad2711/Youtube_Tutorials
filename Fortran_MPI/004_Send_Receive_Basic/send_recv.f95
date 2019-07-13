! Program for basic send and receive call

! Objective: 
!	Make a change to a variable in master process with rank/pid = 0 and print it
!	send it to slave process with rank/pid = 1

!	receive it in slave proceess from master process
!	print it in slave process
!	Make a change to the variable in slave process (rank/pid = 1) and print it
!	send it to master process with rank/pid = 0

!	receive it in master process from slave process
!	print it in master process

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
	
	! Arrangement for saving hostname
	character*(MPI_MAX_PROCESSOR_NAME) :: hostname
	integer :: namesize
	
	! Test data
	! Data 0 for process 0, Data 1 for process 1
	integer :: data0 = 0, data1 = 0
	
	! Initialize MPI
	call MPI_INIT(ierr)
	
	! Setup Communicator Size
	call MPI_COMM_SIZE(MPI_COMM_WORLD, nprocs, ierr)
	
	! Setup Ranks/IDs for each process
	call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
	
	! get hostname for each process
	call MPI_GET_PROCESSOR_NAME(hostname, namesize, ierr)
	
	! type your main code
	
	! get hostname for each process
	call MPI_GET_PROCESSOR_NAME(hostname, namesize, ierr)
	
	! Declare name
	print *, "Hello! I am ", hostname(1:namesize), " with rank ", rank, " of ", nprocs, " process(es)"
	
	! Invoke Master Process
	if( rank == 0) then
	
		! Assign a data value
		data0  = 50
		! print it
		print *, "Rank ", Rank, "Modified Data 0! Data 0 =  ", data0
		
		! Send data to Rank 1,
		! Syntax: call MPI_SEND(start_address, count, datatype, destination pid/rank, tag, communicator, ierr)
		! Tag is an unique identifier. Integer value - 0 - 32767. Tag pairs up send and receive calls.
		call MPI_SEND(data0, 1, MPI_INT, 1, 1, MPI_COMM_WORLD, ierr)
		print *, "Rank ", Rank, "Sent Data 0 to Rank 1"
		
		! Receive Data 1 from rank 1
		! syntax call MPI_RECV(start_address, count, datatype, source, tag, communicator, status, ierr)
		call MPI_RECV(data0, 1, MPI_INT, 1, 2, MPI_COMM_WORLD, status1, ierr)
		print *, "Rank ", Rank, "Received Data 1 from Rank 1 as Data 0! Data 0 = ", data0
		
	end if
	
	! Invoke Non-Master Process of pid/rank = 1
	if( rank == 1) then
	
		! Receive Data 0 from rank 0
		! syntax call MPI_RECV(start_address, count, datatype, source pid/rank, tag, communicator, status, ierr)
		call MPI_RECV(data1, 1, MPI_INT, 0, 1, MPI_COMM_WORLD, status1, ierr)
		print *, "Rank ", rank, "Received Data 0 from Rank 0 as Data 1! Data 1 = ", data1
	
		! Assign a new data value
		data1  = 100
		print *, "Rank ", rank, "Modified Data 1! The new value of Data 1 = ", data1
		
		! Send data to Rank 0,
		! Syntax: call MPI_SEND(start_address, count, datatype, destination, tag, communicator, ierr)
		call MPI_SEND(data1, 1, MPI_INT, 0, 2, MPI_COMM_WORLD, ierr)
		print *, "Rank ", rank, "Sent Data 1 to Rank 0"
		
	end if
	
	! Finalize MPI
	call MPI_FINALIZE(ierr)

end program send_recv
