#!/bin/bash
#===============================================================================
#          FILE: original_figerprint_md5um.sh
#         USAGE: . ${YOUR_PATH}/original_figerprint_md5.sh ../
#   DESCRIPTION: 
#        AUTHOR: IVAN DU
#        E-MAIL: mrivandu@hotmail.com
#        WECHAT: ecsboy
#      TECHBLOG: https://ivandu.blog.csdn.net
#        GITHUB: https://github.com/mrivandu
#       CREATED: 2019-05-01 22:21:53
#       LICENSE: GNU General Public License.
#     COPYRIGHT: © IVAN DU 2019
#      REVISION: v1.0
#===============================================================================

function ori_md5sum(){
  local src_dir=$1;
  find ${src_dir} -type f \-exec md5sum {}>ori_md5sum.db \;
}

# ori_md5sum $1
