! Program to create some variables and store them in a netcdf file
! Steps
! 0. Have some variables
! 1. Create 

program netcdf_saver

    implicit none
    
    ! Number of dimensions for large variables
    integer, parameter :: NDIMS = 4
    integer            :: ncid      ! Netcdf varaible placement id
    
    ! Dimension Names
    character(len=12), parameter :: X_NAME = "X Distance"
    character(len=12), parameter :: Y_NAME = "Y Distance"
    character(len=12), parameter :: Z_NAME = "Z Distance"
    character(len=12), parameter :: T_NAME = "T Time"
    
    ! dimension IDs for the dimension variables
    integer :: x_dimid, y_dimid, z_dimid, t_dimid
    
    ! Size of 4D vars
    integer :: dimids(NDIMS)
    
    ! Variable names
    character (len = *), parameter :: PRES_NAME = "Pressure"
    character (len = *), parameter :: TEMP_NAME = "Temperature"
    character (len = *), parameter :: U_NAME    = "U_Velocity"
    character (len = *), parameter :: V_NAME    = "V_Velocity"
    character (len = *), parameter :: W_NAME    = "W_Velocity"
    character (len = *), parameter :: R_NAME    = "Density"
    
    ! Units for the dimension variables
    character (len = *), parameter :: UNITS      = "units"
    character (len = *), parameter :: PRES_UNITS = "Pa"
    character (len = *), parameter :: TEMP_UNITS = "Kelvin"
    character (len = *), parameter :: R_UNITS    = "kg/m^3"
    character (len = *), parameter :: U_UNITS    = "m/s"
    character (len = *), parameter :: V_UNITS    = "m/s"
    character (len = *), parameter :: W_UNITS    = "m/s"
    character (len = *), parameter :: X_UNITS    = "meters_east"
    character (len = *), parameter :: Y_UNITS    = "meters_north"
    character (len = *), parameter :: Z_UNITS    = "meters_upward"
    character (len = *), parameter :: T_UNITS    = "seconds_forward"
    
    ! variable IDs for the variables
    integer :: pres_varid, temp_varid, u_varid, v_varid, w_varid, r_varid
    
    ! variable IDs for the dimension variables
    integer :: x_varid, y_varid, z_varid, t_varid
    
    print *, "All data defined in script!"
    
    ! Create the file
    call check( nf90_create(path=fname, cmode=or(nf90_noclobber,nf90_64bit_offset),ncid=ncid) )
    !call check( nf90_create(fname, nf90_clobber, ncid) )
    
    ! Define the dimensions
    call check( nf90_def_dim(ncid, X_NAME, nx  , x_dimid) )
    call check( nf90_def_dim(ncid, Y_NAME, ny  , y_dimid) )
    call check( nf90_def_dim(ncid, Z_NAME, nz  , z_dimid) )
    call check( nf90_def_dim(ncid, T_NAME, nt  , t_dimid) )
    
    ! Create dimension variables
    call check( nf90_def_var(ncid, X_NAME, NF90_DOUBLE, x_dimid, x_varid) )
    call check( nf90_def_var(ncid, Y_NAME, NF90_DOUBLE, y_dimid, y_varid) )
    call check( nf90_def_var(ncid, Z_NAME, NF90_DOUBLE, z_dimid, z_varid) )
    call check( nf90_def_var(ncid, T_NAME, NF90_DOUBLE, t_dimid, t_varid) )
    
    ! Set Attributes for the dimension variables
    call check( nf90_put_att(ncid, x_varid, UNITS, X_UNITS) )
    call check( nf90_put_att(ncid, y_varid, UNITS, Y_UNITS) )
    call check( nf90_put_att(ncid, z_varid, UNITS, Z_UNITS) )
    call check( nf90_put_att(ncid, t_varid, UNITS, T_UNITS) )
    
    print *, "Units Placed!"
    
    ! Creating variable slots
    dimids = (/ x_dimid, y_dimid, z_dimid, t_dimid /)
    call check( nf90_def_var(ncid, PRES_NAME, NF90_DOUBLE, dimids, pres_varid) )
    call check( nf90_def_var(ncid, TEMP_NAME, NF90_DOUBLE, dimids, temp_varid) )
    call check( nf90_def_var(ncid,    R_NAME, NF90_DOUBLE, dimids,    r_varid) )
    call check( nf90_def_var(ncid,    U_NAME, NF90_DOUBLE, dimids,    u_varid) )
    call check( nf90_def_var(ncid,    V_NAME, NF90_DOUBLE, dimids,    v_varid) )
    call check( nf90_def_var(ncid,    W_NAME, NF90_DOUBLE, dimids,    w_varid) )
    
    print *, "Data variables created!"
    
    ! Set attributed for the data variables
    call check( nf90_put_att(ncid, pres_varid, UNITS, PRES_UNITS) )
    call check( nf90_put_att(ncid, temp_varid, UNITS, TEMP_UNITS) )
    call check( nf90_put_att(ncid,    r_varid, UNITS,    R_UNITS) )
    call check( nf90_put_att(ncid,    u_varid, UNITS,    U_UNITS) )
    call check( nf90_put_att(ncid,    v_varid, UNITS,    V_UNITS) )
    call check( nf90_put_att(ncid,    w_varid, UNITS,    W_UNITS) )
    
    print *, "Data variable Units Placed!"
    
    ! Close varaible defintions
    call check( nf90_enddef(ncid) )
    
    ! Write the Dimension varaibles
    call check( nf90_put_var(ncid, x_varid,  x) )
    print *, "X variable placed"
    call check( nf90_put_var(ncid, y_varid,  y) )
    print *, "Y variable placed"
    call check( nf90_put_var(ncid, z_varid,  z) )
    print *, "Z variable placed"
    call check( nf90_put_var(ncid, t_varid, ti) )
    print *, "T variable placed"
    
    ! Write the Data variables
    call check( nf90_put_var(ncid, pres_varid, P1) )
    print *, "Pressure variable placed"
    call check( nf90_put_var(ncid, temp_varid, T1) )
    print *, "Temperature variable placed"
    call check( nf90_put_var(ncid,    r_varid, r1) )
    print *, "Density variable placed"
    call check( nf90_put_var(ncid,    u_varid,  u) )
    print *, "u variable placed"
    call check( nf90_put_var(ncid,    v_varid,  v) )
    print *, "v variable placed"
    call check( nf90_put_var(ncid,    w_varid,  w) )
    print *, "w variable placed"
    
    ! Close the file.
    call check( nf90_close(ncid) )

contains

    subroutine check(status)

        implicit none
        integer, intent (in) :: status
        
        if(status /= nf90_noerr) then 
            print *, trim(nf90_strerror(status))
            stop "Stopped"
        end if
        
    end subroutine check
    
end program netcdf_saver
