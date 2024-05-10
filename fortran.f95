! Compiled in OnlineGDB

PROGRAM CeasarCipher
IMPLICIT NONE
CHARACTER(50) :: string = "The quick brown fox jumps over the lazy dog"
INTEGER :: shift = 2
CALL encrypt(string,shift)
PRINT *, string
string = 'hello Fortran'
CALL decrypt(string, shift)
PRINT *, string
string = 'abcdefghijklmnopqrstuvwxyz'
CALL solve(string)
contains 

subroutine encrypt(string, shift)
    character(len=*) :: string
    integer :: shift
    INTEGER :: I = 0
    
    ! Convert string to lowercase if its uppercase
    do i = 1, len(string)
        if (ichar('A') <= ichar(string(i:i)) .and. ichar(string(i:i)) <= ichar('Z')) then
            string(i:i) = char(ichar(string(i:i)) + ichar('a') - ichar('A'))
        endif
    end do
    
    ! Shift the string by adding 'shift' to ascii value found with iachar
    ! - ichar and + ichar parts convert number to 0-25 then back to ascii numbers respectively
    ! Take remainder of current ascii number /26 to wrap around from 'z' to 'a'
    ! Convert final number back to letter with achar
    do i = 1, len(string)
        if (ichar('a') <= ichar(string(i:i)) .and. ichar(string(i:i)) <= ichar('z')) then
            string(i:i) = achar(modulo(iachar(string(i:i)) - ichar('a') + shift, 26) + ichar('a'))
        endif
    end do
end subroutine

subroutine decrypt(string, shift)
    character(len=*) :: string
    integer :: shift
    !decrypt is negative shift encryption
    CALL encrypt(string, shift * (-1))
end subroutine

subroutine solve(string)
    character(len=*) :: string
    INTEGER :: I = 0
    !do all possible shifts and output each, one of them will look right
    do i = 1, 26
        CALL encrypt(string, 1)
        PRINT *, string
    end do
end subroutine
END PROGRAM CeasarCipher
