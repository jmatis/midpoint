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
RUN wget -nv https://raw.githubusercontent.com/jmatis/midpoint/master/start-watch-tomcat.sh -O start-watch-tomcat.sh
ADD start-watch-tomcat.sh /opt/start-watch-tomcat.sh
RUN chown root:root /opt/start-watch-tomcat.sh
RUN chmod 700 /opt/start-watch-tomcat.sh

# start tomcat with midpoint
CMD /opt/start-watch-tomcat.sh
