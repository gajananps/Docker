powershell Expand-Archive -Path C:\Windows\Temp\data.zip -DestinationPath C:\ -Force
icacls C:\data /grant "NT AUTHORITY\NetworkService":(OI)(CI)(IO)F /T
icacls C:\data /grant "User Manager\ContainerAdministrator":(OI)(CI)(IO)(F) /T
net start "MongoDB"