#! /bin/bash
# Sync wiki local and remote

pc="/home/kijima/Dropbox/pages/"
server="xsrv:/home/kijima9791/a9ne.com/public_html/wiki/data/pages/"

# あとで直す
exc=".git"
exc2=".#*" # 一時ファイルは除外

rsync -auvz --exclude $exc --exclude $exc2 $pc $server
rsync -auvz --exclude $exc --exclude $exc2 $server $pc

# 両方から削除や追加を行うので、--deleteで削除をするのはやりにくい…どうすれば？
