! Program to find the solution of a system of simultaneous linear 
! equations using gauss elimination method. Will be using Forward 
! elimination and backward substitution

program gauss_el

    use maths1
    implicit none
    integer, parameter :: n = 3
    real*8, dimension(n,n) :: a, iden
    real*8, dimension(n,n+1) :: ab
    real*8, dimension(n) :: b,x
    real*8 :: detA
    
    print *, "Enter the values of Matrix A:"
    !a = get_a(n,n)
    print *, "Enter the values of Matrix b:"
    !b = get_b(n)
    
    a = reshape((/3.0,2.0,-1.0,2.0,-2.0,0.5,-1.0,4.0,-1.0/),(/n,n/))
    b = reshape((/1.0,-2.0,0.0/),(/n/)) ! Solution = (1, -2, -2)
    !a = reshape((/2,4,3,9/),(/2,2/))
    !b = reshape((/6,15/),(/n/))  ! Solution = (1.5,1)
    !a = reshape((/2.0,-3.0,-2.0,1.0,-1.0,1.0,-1.0,2.0,2.0/),(/n,n/))
    !b = reshape((/8.0,-11.0,-3.0/),(/n/)) ! Solution = (2, 3, -1)
    
    detA = detf(a,n)
    
    iden = get_iden(n)
    ab = get_ab(a,b,n)
    
    print *, "Matrix A is:"
    call print_mat2(a,n,n)
    
    print *, "The Determinant of A is:", deta
    
    print *, "Matrix I is:"
    call print_mat2(iden,n,n)
    
    print *, "Matrix b is:"
    call print_mat1(b,n)
    
    print *, "Matrix Ab is:"
    call print_mat2(ab,n,n+1)
    
    call gauss_fwel_bsolve(ab,x,n)
    
    print *, "The solution is:"
    call print_mat1(x,n)
    
    
end program gauss_el
