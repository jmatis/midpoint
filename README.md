midpoint
========

depends on jmatis/tomcat7

midPoint is a tool that synchronizes several identity repositories, manages them and makes them available in unified form. It belongs to the user provisioning category of the enterprise.

see more at http://www.evolveum.com/midpoint/

I recommend to run it with run.sh script from https://raw.githubusercontent.com/jmatis/midpoint/master/run.sh

wget https://raw.githubusercontent.com/jmatis/midpoint/master/run.sh

chmod 755 run.sh

./run.sh

&lt;ctrl&gt;-&lt;c&gt; after finished watching catalina.out (container will continue to run)


Log in via http://localhost:8080/midpoint/admin/   ( or ip address of your docker server )

Username: administrator
Password: 5ecr3t

