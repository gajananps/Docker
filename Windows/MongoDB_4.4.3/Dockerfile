RUN powershell.exe -Command Invoke-WebRequest "https://scriptingteam.s3.us-east-1.amazonaws.com/corentrepo/workloads/windows/Visualstudio/VC_redist_2015_2017_2019.x64.exe" -OutFile c:\VC_redist_2015_2017_2019.x64.exe;

RUN "c:\VC_redist_2015_2017_2019.x64.exe" /q


RUN powershell.exe -Command Invoke-WebRequest "https://fastdl.mongodb.org/windows/mongodb-windows-x86_64-4.4.3.zip" -OutFile c:\mongodb-windows-x86_64-4.4.3.zip;

powershell.exe Expand-Archive -LiteralPath 'C:\mongodb-windows-x86_64-4.4.3.zip' -DestinationPath C:\

powershell.exe Rename-Item C:\mongodb-win32-x86_64-windows-4.4.3 C:\MongoDB

powershell.exe New-Item -Path "C:\data\db" -ItemType Directory
powershell.exe New-Item -Path "C:\data\log" -ItemType Directory
powershell.exe New-Item C:\data\log\mongod.log

cd C:\MongoDB\bin
mongod --bind_ip_all  --logpath  "C:\data\log\mongod.log"  --logappend  --dbpath  "C:\data\db"  --port 27017 --serviceName "MongoDB" --serviceDisplayName "MongoDB" --install

net start "MongoDB"