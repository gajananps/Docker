rem @echo off
setlocal enabledelayedexpansion
SET "currentpath=%cd%"
echo inprogress > "%currentpath%"\status.log
echo inprogress > "%currentpath%"\info.log
IF EXIST "%currentpath%\dockerinput.properties" (
goto :gettingInputs 
) ELSE (
echo The dockerinput.properties file is not found > "%currentpath%"\info.log
echo The dockerinput.properties file is not found >> "%currentpath%"\error.log
echo failed > "%currentpath%"\status.log
goto :end)

:gettingInputs
for /F "eol=# delims== tokens=1,*" %%a in ('type "%currentpath%"\dockerinput.properties') do (
   if NOT "%%a"=="" if NOT "%%b"=="" set test.%%a=%%b
)
set test. >nul 2>&1
set port=%test.tomcat_port%

::Started to install the Tomcat 9.0.34
:tomcat9
cd ./Dockerfile/ >>"%currentpath%"\error.log 2>&1
docker build -t tomcat:9.0.34 ./ >>"%currentpath%"\error.log 2>&1
docker run -it -d --name ApacheTomcat9034 -p %port%:8080 tomcat:9.0.34 >>"%currentpath%"\error.log 2>&1
docker logs ApacheTomcat9034 >>"%currentpath%"\error.log 2>&1
find /C "Error" "%currentpath%"\error.log > nul
IF %errorlevel% neq 0 (
goto :rechecktomcat9) ELSE (
echo failed > "%currentpath%"\status.log 
echo  Tomcat 9.0.34 container Creation getting failed. Kindly find the error.log for more information > "%currentpath%"\info.log
goto :end)

:rechecktomcat9
find "Invalid" "%currentpath%"\error.log  >nul
IF %errorlevel% neq 0 (
echo Tomcat 9.0.34 container has been created successfully > "%currentpath%"\info.log
echo success > "%currentpath%"\status.log
goto :end) ELSE (
echo Tomcat 9.0.34 container Creation getting failed. Kindly find the error.log for more information  > "%currentpath%"\info.log
echo failed > "%currentpath%"\status.log
goto :end)


:end