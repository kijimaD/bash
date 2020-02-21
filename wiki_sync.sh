#! /bin/bash
# Sync wiki local and remote

pc="/home/kijima/Dropbox/pages/"
server="xsrv:/home/kijima9791/a9ne.com/public_html/wiki/data/pages/"
exc_array=(".git"
	   ".#*")

for item in ${exc_array[@]}; do
    exc+="--exclude $item "
done

rsync -auvz $exc $pc $server
rsync -auvz $exc $server $pc

# 両方から削除や追加を行うので、--deleteで削除をするのはやりにくい…どうすれば？
