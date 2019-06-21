FROM    IMAGE
ENV     MYSQL_HOSTNAME="TEST" MYSQL_PASSWD="TEST" MYSQL_PORT="20003" VERSION="R_2.6" 
LABEL   AUTHOR="IVAN DU" BUILD_DATE="2019-06-21"
WORKDIR /client
COPY    ./client /clinet
COPY    ./scripts /client/scripts
COPY    ./supervisor.conf  /etc/supervisor/supervisord.conf
CMD     [ "/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf" ]
