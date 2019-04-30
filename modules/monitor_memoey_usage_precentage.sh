#!/bin/bash
function detection(){
    local memory_available_precentage=`free|grep 'Mem:'|awk '{print $NF/$2*100}'`
    local memory_limit_precentage=$1 # Threshold precentage.
    if [[ ${memory_available_precentage} < ${memory_limit_precentage} ]];then
        echo "The available memory is insufficient! Please check!";
    else
        echo "The available memory is rich. ";
    fi
    return 0;
}

detection $1