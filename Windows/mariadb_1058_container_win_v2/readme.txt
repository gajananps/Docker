Release Date: 
Workload name: MariaDB
Support OS: Windows Server 2019
Workload Version: 10.5.8
Dependency:
Docker Image ID: scriptdev/mariadb-win:10.5.8
Docker commands:
docker run -it -d --name mariadb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=3HSew62bC4JA -e MYSQL_DATABASE=dbname -e MYSQL_USER=admin -e MYSQL_PASSWORD=Xji9hISdK13 scriptdev/mariadb-win:10.5.8
Manual steps:
after container creation need to run the below file
\WIndows\Temp\data_privileges.bat