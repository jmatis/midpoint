FROM jmatis/tomcat7
MAINTAINER jan.matis@gmail.com

# creating midpoint directory
VOLUME /opt/midpoint

# downloading and adding midpoint war
WORKDIR /opt
RUN wget http://www.evolveum.com/downloads/midpoint/2.2.1/midpoint-2.2.1-dist.tar.gz -O - | tar -zxf-
RUN mv midpoint-2.2.1/war/midpoint.war /opt/tomcat/webapps/
RUN rm -f midpoint-2.2.1-dist.tar

# adding start script
RUN wget -nv https://raw.githubusercontent.com/jmatis/midpoint/master/start-watch-tomcat.sh -O start-watch-tomcat.sh
ADD start-watch-tomcat.sh /opt/start-watch-tomcat.sh
RUN chown root:root /opt/start-watch-tomcat.sh
RUN chmod 700 /opt/start-watch-tomcat.sh

# let's get tomcat on (script will stay on as long as tomcat is running )
CMD /opt/start-watch-tomcat.sh
