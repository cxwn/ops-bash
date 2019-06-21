#!/bin/bash
cat>rtf_calculate.sh<<EOF
#!/bin/bash
round=1
awk 'BEGIN{print "Round\\tAudioTime\\tTotalTime\\tErrorRate\\tRTF"}'
for fl in \`ls 2019060?????/SuccessAudioLists.round1.txt\`;do
    audio_time=\$(cat \${fl}|grep -v 'RTF'|awk '{print \$2}'|egrep -o '[0-9]*(\.[0-9]*)?'|awk 'BEGIN{SUM=0}{SUM+=\$1}END{print SUM}')
    total_time=\$(cat \${fl}|grep -v 'RTF'|awk '{print \$3}'|egrep -o '[0-9]*'|awk 'BEGIN{SUM=0}{SUM+=\$1}END{print SUM}')
    error_num=\$(cat \${fl}|grep -v 'RTF'|wc -l)
    awk -v a_time=\${audio_time} -v t_time=\${total_time} -v round=\${round} -v error_num=\${error_num} 'BEGIN{printf("%5d\\t%9.2f\\t%9d\\t%9.2f\\t%-8.6f\\n",round,a_time,t_time,(200-error_num)/200,t_time/a_time) }'
    ((round++))
done
exit 0
EOF
bash rtf_calculate.sh