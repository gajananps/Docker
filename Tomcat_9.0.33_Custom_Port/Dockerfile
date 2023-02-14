From debian:10

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install wget curl unzip

RUN apt-get -y install openjdk-11-jdk

ENV TOMCAT_VERSION 9.0.33

RUN set -ex && \
   curl -o /tmp/tomcat.tgz \
   https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar xzvf /tmp/tomcat.tgz -C /opt && \
    mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
    sed -i '/Valve/s/^/<!--/g' /opt/tomcat/webapps/manager/META-INF/context.xml && \
    sed -i '/Valve/s/$/-->/g' /opt/tomcat/webapps/manager/META-INF/context.xml && \
    sed -i '/allow/s/^/<!--/g' /opt/tomcat/webapps/manager/META-INF/context.xml && \
    sed -i '/allow/s/$/-->/g' /opt/tomcat/webapps/manager/META-INF/context.xml && \
    rm /tmp/tomcat.tgz && \
    rm -rf /opt/tomcat/webapps/examples && \
    rm -rf /opt/tomcat/webapps/docs && \
    rm -rf /opt/tomcat/webapps/ROOT && \
    rm -rf /tmp/* /var/cache/apk/* 

# Add server.xml port change
ADD server.xml /opt/tomcat/conf/

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
ENV CATALINA_HOME /opt/tomcat
ENV CATALINA_BASE /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin


EXPOSE 9080
WORKDIR /opt/tomcat

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
