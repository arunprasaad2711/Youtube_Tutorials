! Program to explain OpenMP firstprivate lastprivate clauses and ordered clauses

program clauses

    use omp_lib
    implicit none
    
    ! Private clause:
    !   Each thread has its own copy of variables to modify
    !   Values are deleted after the scope of clause
    !   private variables are auto-initialized to 0 before usage!
    !   after scope, the variables assume the value prior to the scope
    
    ! firstprivate clause:
    !   Each thread has its own copy of variables to modify
    !   Values are deleted after the scope of clause
    !   private variables must be initialized before usage or garbage values are used!
    !   after scope, the variables assume the value prior to the scope
    
    ! lastprivate clause:
    !   Each thread has its own copy of variables to modify
    !   Values are deleted after the scope of clause
    !   private variables will be auto-initialized to 0 before usage!
    !   after scope, the variables assume the last value inside the scope
    
    ! critical block:
    !   Makes instructions run serially inside a parallel regime
    !   need not preserves the thread order
    !   executed by having a critical directive
    
    ! ordered block:
    !   Makes instructions run serially inside a parallel regime
    !   preserves the thread order
    !   executed by having an ordered directive
    !   needs an ordered clause
    
    integer, parameter :: num_threads = 4
    integer :: thread_num = 24
    integer :: i
    
    !$ call omp_set_num_threads(num_threads)
    
!    print *, "Thread value before private : ", thread_num
!    !$omp parallel private(thread_num)
!        print *, "thread value = ", thread_num
!        !$ thread_num = omp_get_thread_num()
!        !$ print *, "Active thread:", thread_num
!        !$ thread_num = thread_num + 100
!        !$ print *, "thread = ", omp_get_thread_num()," and thread value = ", thread_num
!    !$omp end parallel
!    print *, "Thread value after private : ", thread_num
    
!    thread_num = 12
    
!    print *, "Thread value before firstprivate : ", thread_num
!    !$omp parallel firstprivate(thread_num)
!        print *, "thread value = ", thread_num
!        !$ thread_num = omp_get_thread_num()
!        !$ print *, "Active thread:", thread_num
!        !$ thread_num = thread_num + 100
!        !$ print *, "thread = ", omp_get_thread_num()," and thread value = ", thread_num
!    !$omp end parallel
!    print *, "Thread value after firstprivate : ", thread_num
    
    print *, "Thread value before lastprivate : ", thread_num
    !!$omp parallel do lastprivate(thread_num)
    !$omp parallel do lastprivate(thread_num) ordered
    do i = 1, 12
        !$omp ordered
        !!$omp critical
        !!$ print *, "thread_num = ", thread_num
        !$ thread_num = omp_get_thread_num() + 100 + i
        !$ print *, "i = ",i," thread = ", omp_get_thread_num(), " thread value = ", thread_num
        !!$omp end critical
        !$omp end ordered
    end do
    !$omp end parallel do
    print *, "Thread value after lastprivate : ", thread_num

end program clauses
