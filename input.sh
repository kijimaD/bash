# echo ABC | { read v ;echo -e "$v"_TEST; }
# echo -e "ABC\nDEF" | (read v ;echo -e "$v"_TEST;)

echo -e "ABC\nDEF" | (v=$(cat) ;echo -e "$v"_TEST;)
$v # <-利用できない
