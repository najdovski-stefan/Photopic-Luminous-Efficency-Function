! =============================================================================
! PROGRAM: it generates data from an aproximation of photopic efficency
! function for the human visual system
!
! Based on this formula:
!     V(λ) = 1.019 * exp(-285.4 * (λ - 0.559)^2)
!   where λ is in micrometers (μm).
!
! AUTHOR:
!   Stefan Najdovski - 01 July 2025
!
! USAGE:
!   $ gfortran -o ph_ef_fn_generate_data ph_ef_fn_generate_data.f90
!   $ ./ph_ef_fn_generate_data
!
!  or use the build_run.sh
!  $ sh build_run.sh
! =============================================================================

PROGRAM generate_v_data
  ! REAL64 for 64-bit real numbers.
  USE, INTRINSIC :: iso_fortran_env, ONLY: REAL64
  IMPLICIT NONE

  ! --- Variable Declarations ---
  CHARACTER(LEN=30)  :: filename             ! The name of the output file
  INTEGER, PARAMETER :: file_unit = 10
  INTEGER            :: lambda_int           ! wavelength in nm
  REAL(KIND=REAL64)  :: lambda_nm, v_result  ! High-precision variables for calculation

  ! --- Setup ---
  filename = 'v_lambda_data.dat'

  ! STATUS='replace' will overwrite the file if it already exists.
  OPEN(UNIT=file_unit, FILE=filename, STATUS='replace', ACTION='write')

  ! descriptive header
  WRITE(file_unit, '(A)') '# Data for V(lambda) from 370 nm to 780 nm'
  WRITE(file_unit, '(A)') '# Column 1: Wavelength (nm)'
  WRITE(file_unit, '(A)') '# Column 2: Calculated V(lambda) value'
  WRITE(file_unit, '(A)') '# -----------------------------------------'

  ! --- Main Calculation Loop ---
  ! Loop through the visible spectrum from 370 nm to 780 nm.
  DO lambda_int = 370, 780

    ! Convert the integer loop variable to a real number for calculations
    lambda_nm = REAL(lambda_int, KIND=REAL64)

    ! Call the function to get the result for the current wavelength
    v_result = calculate_V(lambda_nm)

    ! Write the formatted output to the file
    ! F10.1: A floating-point number 10 characters wide with 1 decimal place.
    ! 2X:     Two spaces for separation.
    ! E20.8:  A floating-point number in scientific notation, 20 characters wide with 8 decimal places.
    WRITE(file_unit, '(F10.1, 2X, E20.8)') lambda_nm, v_result

  END DO

  ! --- Cleanup ---
  CLOSE(file_unit)

  ! Print a confirmation message to the console
  PRINT *, 'Data generation complete.'
  PRINT *, 'Results saved to: ', TRIM(filename)

CONTAINS

  ! ===========================================================================
  ! FUNCTION: calculate_V
  !
  ! DESCRIPTION:
  !   Calculates the value of the function V(lambda) based on the input
  !   wavelength, which is provided in nanometers.
  !
  ! ARGUMENTS:
  !   lambda_nm (REAL64, IN) - The wavelength in nanometers.
  !
  ! RETURNS:
  !   (REAL64) - The result of the V(lambda) calculation.
  ! ===========================================================================
  FUNCTION calculate_V(lambda_nm)
    IMPLICIT NONE

    ! --- Argument and Return Value Declaration ---
    REAL(KIND=REAL64), INTENT(IN) :: lambda_nm
    REAL(KIND=REAL64)             :: calculate_V

    ! --- Local Variable Declaration ---
    REAL(KIND=REAL64) :: lambda_um ! Variable to hold lambda in micrometers

    ! --- Core Calculation ---
    ! The original formula expects lambda in micrometers (μm).
    ! Convert the input from nanometers (nm) to micrometers. (1 μm = 1000 nm)
    lambda_um = lambda_nm / 1000.0_REAL64

    calculate_V = 1.019_REAL64 * EXP(-285.4_REAL64 * (lambda_um - 0.559_REAL64)**2)

  END FUNCTION calculate_V

END PROGRAM generate_v_data
