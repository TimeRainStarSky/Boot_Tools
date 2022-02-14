R="[1;31m";G="[1;32m";Y="[1;33m";C="[1;36m";B="[1;m";O="[m"
abort(){ echo "
$R! $@$O";exit 1;}
echo "$B*************************
$R Shell$Y Script$G Pack$C Tools$O
*************************
    ${G}酷安：${C}时雨丶星空$O"
[ ! -s "$1" ]&&abort "输入文件不存在";[ -z "$2" ]&&abort "输出文件不存在";command -v shc>/dev/null||abort "shc编译器不存在"
echo "
$Y- 正在使用shc编译脚本$O
";shc -vrf "$1"||abort "脚本编译失败"
echo "
$Y- 正在打包为自释放脚本$O
";echo '#脚本已经过编译，需要源代码请联系作者：时雨丶星空
if [ "$(id -u)" != 0 ];then echo "'"$Y"'- 正在获取root权限'"$O"'";su -c "sh \"$0\" \"$@\"";exit;fi;MAGISKPATH="$(magisk --path)";PATH="$PATH:/data/adb/magisk:$MAGISKPATH:$MAGISKPATH/.magisk/busybox";FILE="$(realpath "$0")";EXEC="/data/adb/'"$(basename "$2")"'.x";abort(){ echo "'"$R"'! $@'"$O"'";exit 1;};output_file(){ echo "'"$Y"'- 正在释放脚本'"$O"'";sed "1,2d" "$FILE"|unxz>"$EXEC"||abort "脚本释放失败";chmod 555 "$EXEC"||abort "脚本权限修改失败";OUTPUT=1;};check_exec(){ if [ -x "$EXEC" ]&&[ "$(md5sum "$EXEC"|head -c 32)" = "'"$(md5sum "$1.x"|head -c 32)"'" ];then echo "'"$G"'- 脚本校验成功，开始执行'"$O"'";"$EXEC" "$(dirname "$FILE")" "$FILE"||abort "脚本执行失败";elif [ -z "$OUTPUT" ];then output_file;check_exec;else abort "脚本释放失败";fi;};check_exec;exit'>"$2"||abort "脚本打包失败";xz -9ce "$1.x">>"$2"||abort "脚本打包失败"
echo -n "$(cat "$1"|sed -n 2p|tr "[A-Z]" "[a-z]"|tr ";" "\n")
md5=$(md5sum "$2"|head -c 32)">"$(dirname "$2")/version">"$(dirname "$2")/version"||abort "脚本版本文件生成失败"
cat "$(dirname "$2")/version"||abort "脚本版本文件生成失败";echo "

$G- 打包完成$O"