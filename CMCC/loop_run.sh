#/bin/bash
cat>run.sh<<EOF
#!/bin/bash
counter=1
round=\$1
while true; do
    dotnet TranscribeCore.dll -i sample -o \$(date +%Y%m%d%H%M) -r 200 -e 500 -h 172.25.50.102 -p 34932 -n 2 -t 56 -l zh-CN>>14P5C56T-\${counter}.log
    if [ \$? -eq 0 -a \${counter} -le \${round}  ]; then
        ((counter++))
        continue
    else 
        break
    fi
done
exit 0
EOF

bash run.sh 200