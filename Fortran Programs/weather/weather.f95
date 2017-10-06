! Program to display weather of a day based on temperature and RH

program weather

    implicit none
    integer*4, allocatable, dimension(:) :: temp, rh
    character*10 :: t, r
    integer :: n,i
    
    print *, "Enter the number of day(s):"
    read *,n
    
    allocate(temp(n),rh(n))
    
    do i=1,n
        print *, "Enter the temperature and RH of the day:",i
        read *, temp(i),rh(i)
    end do
    
    do i = 1, n
    if(temp(i)<-90) then
        exit
    else
        select case(temp(i))
            case(:10)
                t = "Freezing"
            case(11:20)
                t = "cold"
            case(21:30)
                t = "Warm"
            case(31:35)
                t = "Hot"
            case(36:)
                t = "Very Hot!"
            case default
                t = "Unknown"
        end select
    
        if(RH(i) > 100 .or. RH(i) < 0) then
            exit
        else
            select case(RH(i))
                case(:20)
                    r = "Dry"
                case(21:40)
                    r = "Little Dry"
                case(41:60)
                    r = "Pleasant"
                case(61:80)
                    r = "Sweaty"
                case(81:)
                    r = "Harsh!"
                case default
                    r = "Unknown"
            end select
        end if
    end if
    
    print '("The day is ", A10, " and ", A10, " with temperature ", i3, &
    & " degree celsius and a Relative Humidity of ", i3, " %")', t,r, &
    & temp(i),rh(i)
    end do

    deallocate(temp, rh)
    
end program weather
