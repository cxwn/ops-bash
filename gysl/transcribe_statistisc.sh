#!/bin/bash
USERNAME="transcribe"
MYSQL_HOST=192.168.156.229
DBNAME="transcribe"
DATE="2019-06-21"
mysql -u ${USERNAME} -h ${MYSQL_HOST} -P ${MYSQL_PORT} -p${MYSQL_PASSWD}  -D ${DBNAME} <<EOF
select current_date();
use ${DBNAME};
select  sum(TranscribeAllSeconds)/3600 as 'Length of Successful Audio Transcribing(hrs)' from transcribe_logs where PodType = 'AsyncService' and TranscribeDay >= ${DATE};
select  sum(TranscribeFrequency) as 'Transcribing Success' from transcribe_logs where PodType = 'AsyncService' and TranscribeDay >= ${DATE};
select  ifnull(sum(TranscribeFrequency),0) as 'Transcribing Error'  from transcribe_logs where PodType = 'AsyncServerError' and TranscribeDay >= ${DATE};
select  sum(TranscribeFrequency) as 'Transcribing Quantity'  from transcribe_logs where (PodType = 'AsyncServerError' or PodType = 'AsyncService' ) and TranscribeDay >= ${DATE};
select  ifnull(sum(TranscribeFrequency),0) as 'Transcribing error quantity'  from transcribe_logs where PodType = 'AsyncServerError' and TranscribeDay = ${DATE};
EOF
