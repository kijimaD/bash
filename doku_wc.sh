#! /bin/bash

# Record characters in directory
# 保存ディレクトリは外部ファイル化する!

count_dir="/home/kijima/Dropbox/pages/"
output_file="/home/kijima/Project/htdocs/wc.csv"

c_count=`find $count_dir -type f -not -name 'wc.csv' | xargs cat | wc -m`
today_date=`date +"%Y,%m,%d"`

echo $today_date","$c_count >> $output_file
