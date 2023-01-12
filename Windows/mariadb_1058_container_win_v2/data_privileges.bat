net stop MySQL
cd C:\Windows\Temp
powershell Expand-Archive -Path C:\Windows\Temp\db.zip -DestinationPath C:\mariadb10.5.8 -Force
icacls C:\mariadb10.5.8\data /grant "NT AUTHORITY\NetworkService":(OI)(CI)(IO)F /T
icacls C:\mariadb10.5.8\data /grant "User Manager\ContainerAdministrator":(OI)(CI)(IO)(F) /T
net start MySQL
timeout 10
cd "C:\Program Files\MariaDB 10.5\bin"
mysql -u root -pk9e234gf1 -e "alter user 'root'@'localhost' identified by '%MYSQL_ROOT_PASSWORD%';"
mysql -u root -p%MYSQL_ROOT_PASSWORD% -e "CREATE USER 'root'@'%%' IDENTIFIED BY '%MYSQL_ROOT_PASSWORD%';"
mysql -u root -p%MYSQL_ROOT_PASSWORD% -e "GRANT ALL ON *.* TO 'root'@'%%';"
mysql -u root -p%MYSQL_ROOT_PASSWORD% -e "CREATE USER '%MYSQL_USER%'@'%%' IDENTIFIED BY '%MYSQL_PASSWORD%';"
mysql -u root -p%MYSQL_ROOT_PASSWORD% -e "GRANT ALL ON *.* TO '%MYSQL_USER%'@'%%';"
mysql -u root -p%MYSQL_ROOT_PASSWORD% -e "CREATE DATABASE IF NOT EXISTS `%MYSQL_DATABASE%`;"