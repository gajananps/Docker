Workload name: Tomcat

Support OS: Debian 10 [Buster]

Workload Version: 9.0.33

Dependency: OpenJDK 11

# Steps to create custom image:

docker build -t tomcat:9.0.33 .

# Docker commands:

To Push Custom Image to Docker Hub

Step 1 : docker login

Step 2 : docker tag tomcat:9.0.33 \<docker hub Username\>/tomcat:9.0.33
    
Step 3 : docker push \<docker hub Username\>/tomcat:9.0.33

    
# To Pull Custom Image from Docker Hub
Step 4 : docker pull \<docker hub Username\>/tomcat:9.0.33

# Create Tomcat Container
Step 5 : docker run -it -d --name ApacheTomcat9033 -p 9080:9080 \<docker hub Username\>/tomcat:9.0.33