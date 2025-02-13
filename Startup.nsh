@echo off
goto SPOOFSERIAL

:SPOOFSERIAL
call :GenerateRandomSerial
AMIDEEFIx64.efi /BS %RandomSerial%
goto SPOOFUUID

:SPOOFUUID
AMIDEEFIx64.efi /SU AUTO
goto SPOOF1

:SPOOF1
call :GenerateRandomSerial
AMIDEEFIx64.efi /SM %RandomSerial%
goto SPOOF2

:SPOOF2
call :GenerateRandomSerial
AMIDEEFIx64.efi /SP %RandomSerial%
goto SPOOF3

:SPOOF3
call :GenerateRandomSerial
AMIDEEFIx64.efi /SV %RandomSerial%
goto SPOOF4

:SPOOF4
call :GenerateRandomSerial
AMIDEEFIx64.efi /SS %RandomSerial%
goto SPOOF5

:SPOOF5
call :GenerateRandomSerial
AMIDEEFIx64.efi /SF %RandomSerial%
goto SPOOF6

:SPOOF6
call :GenerateRandomSerial
AMIDEEFIx64.efi /BT %RandomSerial%
goto SPOOF7

:SPOOF7
call :GenerateRandomSerial
AMIDEEFIx64.efi /BLC %RandomSerial%
goto SPOOF8

:SPOOF8
call :GenerateRandomSerial
AMIDEEFIx64.efi /CM %RandomSerial%
goto SPOOF9

:SPOOF9
call :GenerateRandomSerial
AMIDEEFIx64.efi /CV %RandomSerial%
goto SPOOF10

:SPOOF10
call :GenerateRandomSerial
AMIDEEFIx64.efi /CS %RandomSerial%
goto SPOOF11

:SPOOF11
call :GenerateRandomSerial
AMIDEEFIx64.efi /CA %RandomSerial%
goto SPOOF12

:SPOOF12
call :GenerateRandomSerial
AMIDEEFIx64.efi /CSK %RandomSerial%
goto EXIT

:EXIT
exit

:GenerateRandomSerial
:: Generate a random alphanumeric string of length 16
setlocal enabledelayedexpansion
set "characters=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
set "length=16"
set "RandomSerial="
for /l %%A in (1,1,%length%) do (
    set /a "rand=!random! %% 36"
    for /f %%B in ('echo !rand!') do set "char=!characters:~%%B,1!"
    set "RandomSerial=!RandomSerial!!char!"
)
endlocal & set RandomSerial=%RandomSerial%
goto :eof

:END
