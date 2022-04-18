R="[1;31m";G="[1;32m";Y="[1;33m";C="[1;36m";B="[1;m";O="[m";abort(){ echo "
$R! $@$O";exit 1;};echo "$B—————————————————————————
$R Shell$Y Script$G Pack$C Tools$O
—————————————————————————
    ${G}作者：${C}时雨🌌星空$O";[ -d "$1" ]&&[ -f "$1.sh" ]&&INPUT="$(realpath "$1")"&&BASEINPUT="$(basename "$INPUT")"||abort "输入文件(夹)不存在";[ -n "$2" ]&&OUTPUT="$(realpath "$2")"||abort "输出文件不存在";command -v shc>/dev/null||abort "shc编译器不存在";echo "
$Y- 正在使用shc编译脚本$O
";shc -vrf "$1.sh"||abort "脚本编译失败";echo "
$Y- 正在打包为自释放脚本$O
";echo '#脚本已经过编译，需要源代码请联系作者：时雨🌌星空
if [ "$(id -u)" != 0 ];then echo "'"$Y"'- 正在获取root权限'"$O"'";su -c "sh \"$0\" \"$@\"";exit;fi;BUSYBOXDIR="/data/adb/TimeRainStarSky/busybox";PATH="/data/adb/magisk:$BUSYBOXDIR:$PATH";[ ! -d "$BUSYBOXDIR" ]&&mkdir -p "$BUSYBOXDIR";busybox --install "$BUSYBOXDIR";FILE="$(realpath "$0")";DIR="/data/adb/TimeRainStarSky/'"$BASEINPUT"'";EXEC="$DIR/'"$BASEINPUT"'.sh.x";abort(){ rm -rf "$DIR";echo "'"$R"'! $@'"$O"'";exit 1;};cd "$(dirname "$FILE")"||abort "切换到脚本目录失败";output_file(){ echo "'"$Y"'- 正在释放脚本'"$O"'";[ -d "$DIR" ]&&rm -rf "$DIR";mkdir -p "$DIR";tail -n "+$(awk "/$(echo "5a6a5L2N56ym"|base64 -d)/{print NR+1}" "$FILE"|head -n 1)" "$FILE"|xzcat|tar -xvC "$DIR"||abort "脚本释放失败";OUTPUT=1;};check_exec(){ if [ -x "$EXEC" ]&&[ "$(md5sum "$EXEC"|head -c 32)" = "'"$(md5sum "$INPUT.sh.x"|head -c 32)"'" ];then echo "'"$G"'- 脚本校验成功，开始执行'"$O"'";PATH="$DIR:$PATH";export LD_LIBRARY_PATH="$DIR$([ -n "$LD_LIBRARY_PATH" ]&&echo -n ":$LD_LIBRARY_PATH")";"$EXEC" "$(pwd)" "$FILE"||abort "脚本执行失败";elif [ "$OUTPUT" != 1 ];then output_file;check_exec;else abort "脚本释放失败";fi;};check_exec;exit;定位符'>"$OUTPUT"||abort "脚本打包失败";mv -f "$INPUT.sh.x" "$INPUT";cd "$INPUT";tar -cv *|xz -9cev>>"$OUTPUT"||abort "脚本打包失败";echo -n "$(sed -n 2p "$INPUT.sh"|tr "[A-Z]" "[a-z]"|tr ";" "\n")
md5=$(md5sum "$OUTPUT"|head -c 32)">"$(dirname "$OUTPUT")/version"||abort "脚本版本文件生成失败";cat "$(dirname "$OUTPUT")/version"||abort "脚本版本文件生成失败";echo "

$G- 打包完成$O"