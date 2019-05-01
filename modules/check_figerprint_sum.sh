#!/bin/bash
#===============================================================================
#          FILE: check_figerprint_sum.sh
#         USAGE: sh check_figerprint_sum.sh ori_md5sum.db ../ 
#   DESCRIPTION: 
#        AUTHOR: IVAN DU
#        E-MAIL: mrivandu@hotmail.com
#        WECHAT: ecsboy
#      TECHBLOG: https://ivandu.blog.csdn.net
#        GITHUB: https://github.com/mrivandu
#       CREATED: 2019-05-01 22:35:57
#       LICENSE: GNU General Public License.
#     COPYRIGHT: © IVAN DU 2019
#      REVISION: v1.0
#===============================================================================

function check_md5sum(){
  local ori_md5sum=$1;
  local check_dir=$2;
  find ${check_dir} -type f \-exec md5sum -c ${ori_md5sum} \;
}

# check_md5sum $1 $2
