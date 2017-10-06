! A simple demonstration of Logical and Relational Operators

program rel_logic

    implicit none
    !integer :: a, b
    logical :: m,n
    
    !a = 5
    !b = 4
    m = .true.
    n = .true.
    
!    print *, "A = ",a,", B = ",b
!    print *, "A == B? :", a==b
!    print *, "A > B? :", a>b
!    print *, "A < B? :", a<b
!    print *, "A >= B? :", a>=b
!    print *, "A <= B? :", a<=b
!    print *, "A /= B? :", a/=b
    
    print *, "M = ",m," N = ",n
    !print *, ".not.M = ", .not.m
    !print *, "M or N? :", m.or.N
    !print *, "M and N? :", m.and.n
    print *, "M eqv N? :", m.eqv.n
    print *, "M neqv N? :", m.neqv.n
    
    ! == .eq. equal to
    ! > .gt. greater than
    ! < .lt. less than
    ! >= .ge. greater than or equal to
    ! <= .le. less than or equal to
    ! /= .ne. not equal to

    ! .true. or .false.
    ! .not.(exp1)
    ! (exp1).and.(exp2)
    ! (exp1).or.(exp2)
    ! (exp1).eqv.(exp2)
    ! (exp1).neqv.(exp2)
    
    ! U PEMDAS REL_OP LOG_OP
    ! Unary +5, -7 ! N/A: ++ --
    
    ! a    .not.a   0 = .false.
    ! 1     0       1 = .true.
    ! 0     1
    
    !____________________________________________________________
    !    |      |          |           |            |            |
    ! a  |   b  | a.and.b  |  a.or.b   |   a.eqv.b  |   a.neqv.b |
    !____|______|__________|___________|____________|____________|
    !    |      |          |           |            |            |
    ! 0  |   0  |     0    |     0     |      1     |     0      |
    ! 0  |   1  |     0    |     1     |      0     |     1      |
    ! 1  |   0  |     0    |     1     |      0     |     1      |
    ! 1  |   1  |     1    |     1     |      1     |     0      |
    !____|______|__________|___________|____________|____________|

end program rel_logic
