#!/bin/sh
# ==================================================
# 使用例:
# autorun-pytest.sh test_msg_engine.py 'python3 -m pytest -v'
# いちいちウィンドウが出てきてちょっとウザいんだよな。結果も確認できないし。
# ==================================================

if [ $# -ne 2 ]; then
        echo "実行するには2個の引数が必要です。
        第一引数: 監視対象ファイル名
        第二引数: 監視対象ファイルが更新された際に実行されるコ>マンド
        例： ./autoexec.sh a.cpp 'g++ a.cpp && ./a.cpp'"
        exit 1
fi
echo "監視対象 $1"
echo "実行コマンド $2"
INTERVAL=5 #監視間隔, 秒で指定
last=`ls --full-time $1 | awk '{print $6"-"$7}'`
while true; do
        sleep $INTERVAL
        current=`ls --full-time $1 | awk '{print $6"-"$7}'`
        if [ $last != $current ] ; then
                echo ""
                echo "updated: $current"
                last=$current

		# 画面に出力して、かつ変数に格納したい
                # TEST_INPUT=`eval $2`
		# echo $TEST_INPUT
		echo "`eval $2`"| (TEST_INPUT=$(cat) ;echo -e "$TEST_INPUT";)
		# TEST_INPUTが渡せてないか、代入できてない。
		echo ============~~~~~~~~~~~~~~~~~~~~~~~~~
		echo $TEST_INPUT
		echo ============~~~~~~~~~~~~~~~~~~~~~~~~~
		pass_or_failure=`echo $TEST_INPUT |grep 'failed'|sed s/=//g `
		# 検索->ノイズ削除->代入
		if $pass_or_failure ;
		   # TODO: もっとまともな音にしたい
		    then
		        spd-say 'error error error'
			echo 'failure'
			echo $pass_or_failure
		    else
		        spd-say 'success success success'
			echo 'success'
			echo $pass_or_failure
			
		fi
        fi
done



