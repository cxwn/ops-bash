#!/bin/bash
container_id='8003afaf1300'
for dir in "wavs" "diazirzer_result";
 do
   [ -d ${dir} ] && rm -rf ${dir} && mkdir ${dir}
   [ ! -d ${dir} ] && mkdir ${dir}
  done
for file in `ls samples`;
  do
    dir_name=$(echo ${file}|awk -F "." '{print $1}')
    mkdir wavs/${dir_name}
    cp samples/${file} wavs/${dir_name}
    docker exec container_id rm -rf /result
    dotnet TranscribeCore.dll -i wavs/${dir_name} -o sr_result -r 200 -e 500 -h localhost -p 34932 -n 2 -t 1 -l zh-CN
    sleep 5
    for dia in `docker exec container_id ls /result`;
      do
        extension=$(echo ${dia}|awk -F "." '{print $2}')
        docker cp container_id:/result/${dia} diarizer_result/${dir_name}.${extension}
      done
    docker exec container_id rm -rf /result
  done