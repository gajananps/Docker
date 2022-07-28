FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN powershell.exe -Command \
Invoke-WebRequest "https://scriptingteam.s3.us-east-1.amazonaws.com/corentrepo/workloads/windows/Java/jdk-8u251-windows-x64.exe" -OutFile c:\windows\Temp\jdk-8u251-windows-x64.exe; \
Start-Process "c:\windows\Temp\jdk-8u251-windows-x64.exe" -ArgumentList ADDLOCAL='ToolsFeature,SourceFeature,PublicjreFeature  /s  /qn'; \
sleep 10; \
Invoke-WebRequest "https://scriptingteam.s3.us-east-1.amazonaws.com/corentrepo/workloads/windows/Tomcat/apache-tomcat-9.0.34-windows-x64.zip" -OutFile c:\windows\Temp\apache-tomcat-9.0.34-windows-x64.zip; \
expand-archive -Path 'c:\windows\Temp\apache-tomcat-9.0.34-windows-x64.zip' -DestinationPath 'c:\'; \
Remove-Item -Path "C:\windows\Temp\apache-tomcat-9.0.34-windows-x64.zip" -Force; \
Rename-Item -Path "C:\apache-tomcat-9.0.34" -NewName "C:\Tomcat";

EXPOSE 8080

ENV JAVA_HOME="C:\Program Files\Java\jdk1.8.0_251" 

ENV CATALINA_HOME="C:\Tomcat"

CMD C:\Tomcat\bin\catalina.bat run