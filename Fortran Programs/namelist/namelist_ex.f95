! Program to demonstrate the namelist feature

program namelist_ex

    implicit none
    character :: name1*10 = "G. Arun"
    integer , dimension(5) :: percents = (/80, 96, 85, 90, 92/)
    real*8 :: avg , val1
    integer :: class1 = 1, rank1 = 4
    namelist /dat/ name1, val1, avg, class1, rank1
    
    val1 = percents(4)
    avg = sum(percents)/5
    
    print *, "The details are:"
    write(*, nml = dat)

end program namelist_ex
