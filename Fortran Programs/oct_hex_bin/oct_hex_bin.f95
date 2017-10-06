! Program to work with octal, binary and hexa decimal numbers

program oct_hex_bin

    implicit none
    integer :: i = -67
    real :: j = -45.68
    
    ! IEEE to store real numbers
    ! 4 byte float
    ! 32 bits
    ! 1 bit = sign (left most)
    ! 15 bits = mantissa
    ! rest = exponent in power of 2
    ! 8 byte float
    ! 64 bits
    ! 1 bit = sign
    ! 52 bits = mantissa (guessing) eg: 0.256398
    ! 11 bits = exponent (guessing) eg: 27 = 2**27
    ! 0.256398*2**27 = base 10
    
    print *, "The real j in real is:"
    write(*,"(f14.8)"), j
    print *, "The real j in binary is:"
    write(*,"(b45.7)"), j
    print *, "The real j in octal is:"
    write(*,"(o20.7)"), j
    print *, "The real j in hexa decimal is:"
    write(*,"(z20.7)"), j
    
    print *, "The integer i in integer is:"
    write(*,"(i4)"), i
    print *, "The integer i in binary is:"
    write(*,"(b20)"), i
    print *, "The integer i in octal is:"
    write(*,"(o20)"), i
    print *, "The integer i in hexa decimal is:"
    write(*,"(z20)"), i

end program oct_hex_bin
