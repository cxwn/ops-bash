FROM    IMAGE
ENV     MYSQL_HOSTNAME="TEST" MYSQL_PASSWD="TEST" PORT="20003" VERSION="R_2.6" 
LABEL   AUTHOR="IVAN DU" BUILD_DATE="2019-06-21"
WORKDIR /client
COPY    ./client /clinet
COPY    ./scripts /client/scrpts
CMD     [ "/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf" ]
