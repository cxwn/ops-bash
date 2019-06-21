#!/bin/bash
#===============================================================================
#          FILE: crontab_clear.sh
#         USAGE: . ${YOUR_PATH}/crontab_clear.sh 
#   DESCRIPTION: 
#        AUTHOR: IVAN DU
#        E-MAIL: mrivandu@hotmail.com
#        WECHAT: ecsboy
#      TECHBLOG: https://ivandu.blog.csdn.net
#        GITHUB: https://github.com/mrivandu
#       CREATED: 2019-06-13 18:04:24
#       LICENSE: GNU General Public License.
#     COPYRIGHT: © IVAN DU 2019
#      REVISION: v1.0
#===============================================================================

cat>clear.sh<<EOF
#!/bin/bash
while true;
  do
    pgrep unidec_grpc>&/dev/null
    if [ \$? -ne 0 ];then
      (/bin/unidec_grpc &)
    else
      pgrep palrun>&/dev/null
      if [ \$? -eq 0 ];then
        interval=\$((43200+\${RANDOM}%3600))
        sleep \${interval}
        pgrep palrun|xargs kill -9
      else
        bash /run.sh
      fi
    fi
  done
EOF
bash clear.sh
