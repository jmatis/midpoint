FROM jmatis/tomcat7
MAINTAINER jan.matis@gmail.com

# create midpoint volume (to be mounted from host linux to preserver data)
VOLUME /opt/midpoint

# download and add midpoint war
WORKDIR /opt
RUN wget http://www.evolveum.com/downloads/midpoint/2.2.1/midpoint-2.2.1-dist.tar.gz -O - | tar -zxf-
RUN mv midpoint-2.2.1/war/midpoint.war /opt/tomcat/webapps/
RUN rm -f midpoint-2.2.1-dist.tar

# add start script
RUN wget -nv https://raw.githubusercontent.com/jmatis/midpoint/master/tomcat-supervisor.sh -O tomcat-supervisor.sh
RUN chown root:root /opt/tomcat-supervisor.sh
RUN chmod 700 /opt/tomcat-supervisor.sh

# export ssh adn tomcat's port
EXPOSE 22 8080

CMD ["/usr/bin/supervisord"]
