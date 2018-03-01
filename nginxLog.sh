#!/bin/bash

log_dir="/var/log"
nginx_dir="/usr/local/openresty/nginx/sbin"
date_str=`date +%Y%m%d`
save_day=14
dealFile=("kkkk-access" "kkkk-error" "access" "error" "kkkk-gmweb-access" "kkkk-gmweb-error" "kkkk.stat.com-access" "kkkk.stat.com-error")

cd $log_dir

#按日期移动文件
file_count=${#dealFile[@]}
for((i=0;i<file_count;i++))
do
    file_name=${dealFile[i]}
    mv $log_dir/${file_name}.log $log_dir/${file_name}-${date_str}.log
done

$nginx_dir/nginx -s reopen

#删除过期的文件
for((i=0;i<file_count;i++))
do
    file_name=${dealFile[i]}

    find $log_dir -mtime +$save_day -type f -name "*${file_name}-*" >> rm.log
    find $log_dir -mtime +$save_day -type f -name "*${file_name}-*" | xargs rm -f
done
