#!/bin/bash
#===============================================================================
#          FILE: ~/sendmail.sh
#         USAGE: sudo sh ~/sendmail.sh 
#   DESCRIPTION: All rights reserved. https://github.com/mrivandu/ops/blob/master/sendmail.sh
#        AUTHOR: IVAN DU (mrivandu), mrivandu@hotmail.com
#       CREATED: 2019-04-30-18:53:32
#      REVISION: v1.0
#==============================================================================
function sendmail(){
    local sendmail_username=$1
    local sendmail_passwd=$2
    local receiver=$3
    local subject=$4
    local mail_body=$5 # The path of mail body.
# Check if mailx is installed.
    if [ -n "`sudo rpm -qa|grep mailx`" ];then 
        echo "Mailx is installed!";
    else
    yum -y install mailx;
    fi
# Check whether user is configured.
    if [ -z "`grep ${sendmail_username} /etc/mail.rc`" ];then 
       echo "set from=${sendmail_username}@163.com smtp=smtp.163.com smtp-auth-user=${sendmail_username} smtp-auth-password=${sendmail_passwd} smtp-auth=login">>/etc/mail.rc;
    else
       echo "The user configured. ";
    fi
# Send mail.
    mail -s "${subject}--`date +%F-%T`" ${receiver} <${mail_body};
    if [ $? -eq 0 ];then
      echo "The system has sent an email to ${receiver}, please note check that. ";
    else
      echo "Mail delivery to ${receiver} is failed, please check the configuration! ";
      sleep 10;
    fi
}

sendmail $1 $2 $3 $4 $5