AGE=78
echo $AGE
gfortran -c *.f95
gfortran *.o -o name.exe

cat > namelist_sample << NAMELIST

&list1
 
    year            =   2016,
    MONTH           =   "February",
    AGE             =   $AGE,
    PIZZA_COST      =   350.00,
    student         =   .TRUE.,
    TEST_SCORES     =   45.0, 56.2, 56.6, 78.9, 78.5,
        49.6, 45.9, 35.8, 12.6, 19.0,
    my_name         =   "Arun",
    RPI             =   (5.6,7.8),
    DAY             =   "Tuesday",
    EYE_COLOUR      =   "Yellow"
&end

NAMELIST

./name.exe

