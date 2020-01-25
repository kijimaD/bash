#! /bin/bash

# ディレクトリは引数指定にしたほうがいい

pc="/home/kijima/Dropbox/pages/"
server="xsrv:/home/kijima9791/a9ne.com/public_html/wiki/data/pages/"

rsync -auvz --delete $pc $server
rsync -auvz --delete $server $pc
