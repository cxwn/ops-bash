#!/bin/bash
USERNAME="transcribe"
DBNAME="transcribe"
DATE="2019-06-21" 
mysql -u ${USERNAME} -h ${MYSQL_HOSTNAME} -P ${MYSQL_PORT} -p ${MYSQL_PASSWD}  -D ${DBNAME} <<EOF
select current_date();
use ${DBNAME};
select  sum(TranscribeAllSeconds)/3600 as '音频总时长' from transcribe_logs where PodType = 'AsyncService' and TranscribeDay >= ${DATE};
select  sum(TranscribeFrequency) as '转写成功量' from transcribe_logs where PodType = 'AsyncService' and TranscribeDay >= ${DATE};
select  ifnull(sum(TranscribeFrequency),0) as '转写错误量'  from transcribe_logs where PodType = 'AsyncServerError' and TranscribeDay >= ${DATE};
select  sum(TranscribeFrequency) as '转写量'  from transcribe_logs where (PodType = 'AsyncServerError' or PodType = 'AsyncService' ) and TranscribeDay >= ${DATE};
select  ifnull(sum(TranscribeFrequency),0) as '转写错误量'  from transcribe_logs where PodType = 'AsyncServerError' and TranscribeDay = ${DATE};
EOF
