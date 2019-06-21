FROM       IMAGE
ENV        MYSQL_HOSTNAME="TEST" MYSQL_PASSWD="TEST" MYSQL_PORT="20003" VERSION="R_2.6" 
LABEL      AUTHOR="IVAN DU" BUILD_DATE="2019-06-21"
WORKDIR    /client
VOLUME     /var/lib/mysql
COPY       ./client /client
COPY       ./scripts /client/scripts
COPY       ./supervisor.conf  /etc/supervisor/supervisord.conf
COPY       docker-entrypoint.sh /usr/local/bin/
RUN        ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE     3306 33060
CMD        [ "/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf" ]
