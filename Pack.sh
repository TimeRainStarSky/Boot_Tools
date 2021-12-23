R="[1;31m";G="[1;32m";Y="[1;33m";C="[1;36m";B="[1;m";O="[m"
if [ "$(id -u)" != 0 ];then
  echo "$Y- 正在获取root权限$O";su -c "sh $0 $@";exit
fi
MAGISKPATH="$(magisk --path)";PATH="/data/adb/magisk:$MAGISKPATH:$MAGISKPATH/.magisk/busybox:$PATH"
echo "$B************************
$R HGcc$Y Script$G Pack$C Tools$O
************************
    $G酷安：$C时雨丶星空$O"
[ ! -f "$1" ]&&echo "$R! $1文件不存在$O"&&exit 1;[ -z "$(which HGcc)" ]&&echo "$R! HGcc编译器不存在$O"&&exit 1
echo "
$Y- 正在使用HGcc编译脚本$O
"
HGcc -r "$1" "$1.HGcc"
echo "
$Y- 正在打包为自释放脚本$O
"
echo -n '#脚本已经过编译，需要源代码请联系作者：时雨丶星空
if [ "$(id -u)" != 0 ];then
  echo "'"$Y"'- 正在获取root权限'"$O"'";su -c "sh $0 $@";exit
fi
MAGISKPATH="$(magisk --path)";PATH="/data/adb/magisk:$MAGISKPATH:$MAGISKPATH/.magisk/busybox:$PATH"
[ "$0" != "${0%/*}" ]&&cd "${0%/*}";EXEC="/data/adb/'"${2##*/}"'.HGcc";MD5="'"$(md5sum "$1.HGcc"|head -c 32)"'"
abort(){
  echo "
'"$R"'! $@'"$O"'";exit 1
}
output_file(){
  BASE64="'"$(cat "$1.HGcc"|base64)"'"
  echo "'"$Y"'- 正在释放脚本'"$O"'";echo "$BASE64"|base64 -d>"$EXEC"||abort "脚本释放失败";chmod 555 "$EXEC"||abort "脚本权限修改失败"
}
check_exec(){
  if [ -x "$EXEC" ]&&[ "$(md5sum "$EXEC"|head -c 32)" = "$MD5" ];then
    echo "'"$G"'- 脚本校验成功，开始执行'"$O"'";"$EXEC" "$(pwd)" "${0##*/}"||abort "脚本执行失败"
  else
    output_file;check_exec
  fi
}
check_exec'>"$2"
echo -n "version=$(cat "$1"|sed -n s/^VERSION=//p)
name=$(cat "$1"|sed -n s/^NAME=//p)
md5=$(md5sum "$2"|head -c 32)">"${2%/*}/version"
cat "${2%/*}/version"
echo "

$G- 打包完成$O"