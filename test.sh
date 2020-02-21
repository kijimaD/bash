#!/bin/bash

array=("aa"
       "bb")
for item in ${array[@]}; do
    exc+="--exclude $item "
done

echo $exc
# $excが最終的に--exclude a --exclude b…となるような
