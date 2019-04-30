#!/bin/bash
#===============================================================================
#          FILE: ~/monitor_memoey_usage_precentage.sh
#         USAGE: sudo sh ~/monitor_memoey_usage_precentage.sh 30 
#   DESCRIPTION: All rights reserved. https://github.com/mrivandu/ops/blob/master/modules/monitor_memoey_usage_precentage.sh
#        AUTHOR: IVAN DU (mrivandu), mrivandu@hotmail.com
#       CREATED: 2019-04-30-21:44:32
#      REVISION: v1.0
#==============================================================================
function sendmail(){
function detection(){
    local memory_available_precentage=`free|grep 'Mem:'|awk '{print $NF/$2*100}'`
    local memory_limit_precentage=$1 # Threshold precentage.
    if [[ ${memory_available_precentage} < ${memory_limit_precentage} ]];then
        echo "The available memory is insufficient! Please check!";
    else
        echo "The available memory is rich. ";
    fi
}

# detection $1