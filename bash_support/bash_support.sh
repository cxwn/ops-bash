#!/bin/bash
#===============================================================================
#          FILE: bash_support.sh
#         USAGE: . ${YOUR_PATH}/bash_support.sh
#   DESCRIPTION:
#         NOTES: NONE
#        AUTHOR: IVAN DU
#        E-MAIL: mrivandu@hotmail.com
#        WECHAT: ecsboy
#      TECHBLOG: https://ivandu.blog.csdn.net
#        GITHUB: https://github.com/mrivandu
#       CREATED: 2019年05月01日 08时17分59秒
#      REVISION: v1.0
#===============================================================================

cd ~
curl -L -C - -O https://raw.githubusercontent.com/mrivandu/ops/master/bash_support/bash-support.tar.gz
tar -xvzf bash-support.tar.gz
rm -f bash-support.tar.gz
chown -R ${USER}:$(id -ng) .vim
echo -e "filetype plugin on\nset nu">>~/.vimrc