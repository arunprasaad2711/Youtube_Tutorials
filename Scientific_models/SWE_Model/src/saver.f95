! This is the main solver module

subroutine data_saver

    use netcdf
    use params
    use model_vars

    implicit none

    ! Number of dimensions for large variables
    integer, parameter :: NDIMS3 = 3
    integer, parameter :: NDIMS2 = 2
    integer            :: ncid      ! Netcdf varaible placement id

    ! Dimension Names
    character(len=12), parameter :: X_NAME = "X Distance"
    character(len=12), parameter :: Y_NAME = "Y Distance"
    character(len=12), parameter :: T_NAME = "T Time"

    ! dimension IDs for the dimension variables
    integer :: x_dimid, y_dimid, t_dimid

    ! Size of 3D vars
    integer :: dimids3(NDIMS3)
    integer :: dimids2(NDIMS2)

    ! Variable names
    character (len = *), parameter :: U_NAME    = "U_Velocity"
    character (len = *), parameter :: V_NAME    = "V_Velocity"
    character (len = *), parameter :: H_NAME    = "H_Level"
    character (len = *), parameter :: F_NAME    = "F_Coriolis"

    ! Units for the dimension variables
    character (len = *), parameter :: UNITS      = "units"
    character (len = *), parameter :: U_UNITS    = "m/s"
    character (len = *), parameter :: V_UNITS    = "m/s"
    character (len = *), parameter :: H_UNITS    = "m"
    character (len = *), parameter :: F_UNITS    = "1/s"
    character (len = *), parameter :: X_UNITS    = "meters_east"
    character (len = *), parameter :: Y_UNITS    = "meters_north"
    character (len = *), parameter :: T_UNITS    = "seconds_forward"

    ! variable IDs for the variables
    integer :: u_varid, v_varid, h_varid, f_varid

    ! variable IDs for the dimension variables
    integer :: x_varid, y_varid, t_varid

    print *, "All data defined in script!"

    ! Create the file
    call check( nf90_create(path=fname, cmode=or(nf90_noclobber,nf90_64bit_offset),ncid=ncid) )
    !call check( nf90_create(fname, nf90_clobber, ncid) )

    ! Define the dimensions
    call check( nf90_def_dim(ncid, X_NAME, nx  , x_dimid) )
    call check( nf90_def_dim(ncid, Y_NAME, ny  , y_dimid) )
    call check( nf90_def_dim(ncid, T_NAME, nt  , t_dimid) )

    ! Create dimension variables
    call check( nf90_def_var(ncid, X_NAME, NF90_DOUBLE, x_dimid, x_varid) )
    call check( nf90_def_var(ncid, Y_NAME, NF90_DOUBLE, y_dimid, y_varid) )
    call check( nf90_def_var(ncid, T_NAME, NF90_DOUBLE, t_dimid, t_varid) )

    ! Set Attributes for the dimension variables
    call check( nf90_put_att(ncid, x_varid, UNITS, X_UNITS) )
    call check( nf90_put_att(ncid, y_varid, UNITS, Y_UNITS) )
    call check( nf90_put_att(ncid, t_varid, UNITS, T_UNITS) )

    print *, "Units Placed!"

    ! Creating variable slots
    dimids3 = (/ x_dimid, y_dimid, t_dimid /)
    dimids2 = (/ x_dimid, y_dimid /)
    
    call check( nf90_def_var(ncid,    U_NAME, NF90_DOUBLE, dimids3,    u_varid) )
    call check( nf90_def_var(ncid,    V_NAME, NF90_DOUBLE, dimids3,    v_varid) )
    call check( nf90_def_var(ncid,    H_NAME, NF90_DOUBLE, dimids3,    h_varid) )
    call check( nf90_def_var(ncid,    F_NAME, NF90_DOUBLE, dimids2,    f_varid) )

    print *, "Data variables created!"

    ! Set attributed for the data variables
    call check( nf90_put_att(ncid,    u_varid, UNITS,    U_UNITS) )
    call check( nf90_put_att(ncid,    v_varid, UNITS,    V_UNITS) )
    call check( nf90_put_att(ncid,    h_varid, UNITS,    H_UNITS) )
    call check( nf90_put_att(ncid,    f_varid, UNITS,    F_UNITS) )

    print *, "Data variable Units Placed!"

    ! Close variable definitions
    call check( nf90_enddef(ncid) )

    ! Write the Dimension variables
    call check( nf90_put_var(ncid, x_varid,  x) )
    print *, "X variable placed"
    call check( nf90_put_var(ncid, y_varid,  y) )
    print *, "Y variable placed"
    call check( nf90_put_var(ncid, t_varid, t) )
    print *, "T variable placed"

    ! Write the Data variables
    call check( nf90_put_var(ncid,    u_varid,  u) )
    print *, "u variable placed"
    call check( nf90_put_var(ncid,    v_varid,  v) )
    print *, "v variable placed"
    call check( nf90_put_var(ncid,    h_varid,  h) )
    print *, "h variable placed"
    call check( nf90_put_var(ncid,    f_varid,  f) )
    print *, "f variable placed"

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

end subroutine data_saver
