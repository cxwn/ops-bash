#!/bin/bash
cat>rtf_calculate.sh<<EOF
#!/bin/bash
log=06041136
round=14
awk 'BEGIN{print "Round\\tAudioTime\\tTotalTime\\tErrorRate\\tRTF"}'
for((count=1;count<=\${round};count++));do
    audio_time=\$(cat \${log}/SuccessAudioLists.round\${count}.txt|grep -v 'RTF'|awk '{print \$2}'|egrep -o '[0-9]*(\.[0-9]*)?'|awk 'BEGIN{SUM=0}{SUM+=\$1}END{print SUM}')
    total_time=\$(cat \${log}/SuccessAudioLists.round\${count}.txt|grep -v 'RTF'|awk '{print \$3}'|egrep -o '[0-9]*'|awk 'BEGIN{SUM=0}{SUM+=\$1}END{print SUM}')
    error_num=\$(cat \${log}/SuccessAudioLists.round\${count}.txt|grep -v 'RTF'|wc -l)
    awk -v a_time=\${audio_time} -v t_time=\${total_time} -v round=\${count} -v error_num=\${error_num} 'BEGIN{printf("%5d\\t%9.2f\\t%9d\\t%9.2f\\t%-8.2f\n",round,a_time,t_time,(50-error_num)/50,t_time/a_time) }'
done
EOF
bash rtf_calculate.sh