#!/bin/bash
USERNAME="transcribe"
DBNAME="transcribe"
DATE="2019-06-21" 
mysql -u ${USERNAME} -h ${MYSQL_HOSTNAME} -P ${MYSQL_PORT} -p ${MYSQL_PASSWD}  -D ${DBNAME} <<EOF
select current_date();
use ${DBNAME};
select  sum(TranscribeAllSeconds)/3600 as 'The length of successful audio transcribing(hrs)' from transcribe_logs where PodType = 'AsyncService' and TranscribeDay >= ${DATE};
select  sum(TranscribeFrequency) as 'Transcribing success' from transcribe_logs where PodType = 'AsyncService' and TranscribeDay >= ${DATE};
select  ifnull(sum(TranscribeFrequency),0) as 'Transcribing erro'  from transcribe_logs where PodType = 'AsyncServerError' and TranscribeDay >= ${DATE};
select  sum(TranscribeFrequency) as 'Transcribing quantity'  from transcribe_logs where (PodType = 'AsyncServerError' or PodType = 'AsyncService' ) and TranscribeDay >= ${DATE};
select  ifnull(sum(TranscribeFrequency),0) as 'Transcribing error quantity'  from transcribe_logs where PodType = 'AsyncServerError' and TranscribeDay = ${DATE};
EOF
