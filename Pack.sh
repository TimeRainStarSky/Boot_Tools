R="[1;31m";G="[1;32m";Y="[1;33m";C="[1;36m";B="[1;m";O="[m";abort(){ echo "
$R! $@$O";exit 1;};echo "$B*************************
$R Shell$Y Script$G Pack$C Tools$O
*************************
    ${G}作者：${C}时雨🌌星空$O";[ -f "$1" ]&&INPUT="$(realpath "$1")"||abort "输入文件不存在";[ -n "$2" ]&&OUTPUT="$(realpath "$2")"||abort "输出文件不存在";command -v shc>/dev/null||abort "shc编译器不存在";echo "
$Y- 正在使用shc编译脚本$O
";shc -vrf "$1"||abort "脚本编译失败";echo "
$Y- 正在打包为自释放脚本$O
";echo '#脚本已经过编译，需要源代码请联系作者：时雨🌌星空
if [ "$(id -u)" != 0 ];then echo "'"$Y"'- 正在获取root权限'"$O"'";su -c "sh \"$0\" \"$@\"";exit;fi;PATH="/system/bin:/data/adb/magisk:$(magisk --path)/.magisk/busybox:$PATH";FILE="$(realpath "$0")";EXEC="/data/adb/TimeRainStarSky/Boot_Tools/'"$(basename "$OUTPUT")"'.x";abort(){ rm -rf "$EXEC";echo "'"$R"'! $@'"$O"'";exit 1;};output_file(){ echo "'"$Y"'- 正在释放脚本'"$O"'";mkdir -p "$(dirname "$EXEC")";tail -n "+$(awk "/$(echo "5a6a5L2N56ym"|base64 -d)/{print NR+1}" "$FILE"|head -n 1)" "$FILE"|xzcat>"$EXEC"||abort "脚本释放失败";chmod 555 "$EXEC"||abort "脚本权限修改失败";OUTPUT=1;};check_exec(){ if [ -x "$EXEC" ]&&[ "$(md5sum "$EXEC"|head -c 32)" = "'"$(md5sum "$INPUT.x"|head -c 32)"'" ];then echo "'"$G"'- 脚本校验成功，开始执行'"$O"'";"$EXEC" "$(dirname "$FILE")" "$FILE"||abort "脚本执行失败";elif [ "$OUTPUT" != 1 ];then output_file;check_exec;else abort "脚本释放失败";fi;};check_exec;exit;定位符'>"$OUTPUT"||abort "脚本打包失败";xz -9ce "$INPUT.x">>"$OUTPUT"||abort "脚本打包失败";echo -n "$(sed -n 2p "$INPUT"|tr "[A-Z]" "[a-z]"|tr ";" "\n")
md5=$(md5sum "$OUTPUT"|head -c 32)">"$(dirname "$OUTPUT")/version"||abort "脚本版本文件生成失败";cat "$(dirname "$OUTPUT")/version"||abort "脚本版本文件生成失败";echo "

$G- 打包完成$O"