! Program for demonstrating array operations

program array_funcs

    use maths1
    implicit none
    real*8 :: prod, sum1
    integer, parameter :: r = 3, c = 2
    real*8, dimension(1) :: dp
    real*8, dimension(r,c) :: a1
    real*8, dimension(r,r) :: a3
    real*8, dimension(c,r) :: at, a2
    real*8, dimension(r*c) :: b1, b2
    
    a1 = reshape((/1,2,3,4,5,6/),(/r,c/))
    a2 = reshape((/1,2,3,4,5,6/),(/c,r/))
    b1 = reshape((/1,2,3,4,5,6/),(/r*c/))
    b2 = reshape((/1,2,3,4,5,6/),(/r*c/))
    
    dp = dot_product(b1,b2) ! Does the dot product
    at = transpose(a1)      ! Returns the transpose
    a3 = matmul(a1,a2)       ! Matrix Multiplication
    prod = product(a1)      ! Product of all entries in an array
    sum1 = sum(a1)           ! Sum of all entries in a matrix/array
    
    print *, "The Matrix a1 is:"
    call print_mat2(a1,r,c)
    
    print *, "The Matrix a2 is:"
    call print_mat2(a2,c,r)
    
    print *, "The Equal Matrix b1 and b2 is:"
    call print_mat1(b1,r*c)
    
    print *, "The max val of a1 is : ", maxval(a1)
    print *, "The min val of a1 is : ", minval(a1)
    print *, "The sum of a1 is :", sum1
    print *, "The prod of a1 is:", prod
    
    print *, "The Transpose of a1 is:"
    call print_mat2(at,c,r)
    
    print *, "The Matrix Multiplication of a1 and a2 is:"
    call print_mat2(a3,r,r)
    
    print *, "The dot product of b1 and b2 is:",dp
    
end program array_funcs
