#!/system/bin/sh
R="\e[1;31m"
G="\e[1;32m"
Y="\e[1;33m"
C="\e[1;36m"
B="\e[1;m"
O="\e[m"
PATH=/data/adb/magisk:"$(MAGISKPATH="$(magisk --path 2>/dev/null)";[ ! -z "$MAGISKPATH" ]&&echo "$MAGISKPATH:")"/system/bin:"$PATH"
BUSYBOX="$(busybox &>/dev/null&&echo busybox)"
[ "$(id -u)" -ne 0 ]&&$BUSYBOX echo -e "$Y- 正在获取root权限$O"&&exec su -c sh "$0" "$@"
[ "$(id -u)" -ne 0 ]&&$BUSYBOX echo -e "$R! 获取root权限失败$O"&&exit 1
$BUSYBOX echo -e "$B************************
$R HGcc$G Script$Y Pack$C Tools$O
************************
    $G酷安：$C时雨丶星空$O"
[ ! -f "$1" ]&&$BUSYBOX echo -e "$R! $1文件不存在$O"&&exit 1
[ -z "$(which HGcc 2>/dev/null)" ]&&$BUSYBOX echo -e "$R! HGcc编译器不存在$O"&&exit 1
$BUSYBOX echo -e "
$Y- 正在使用HGcc编译脚本$O
"
HGcc -r "$1" "$1.HGcc"
$BUSYBOX echo -e "
$Y- 正在打包为自释放脚本$O
"
$BUSYBOX echo -en '#脚本已经过编译，需要源代码请联系作者：时雨丶星空
PATH=/data/adb/magisk:"$(MAGISKPATH="$(magisk --path 2>/dev/null)";[ ! -z "$MAGISKPATH" ]&&echo "$MAGISKPATH:")"/system/bin:"$PATH"
BUSYBOX="$(busybox &>/dev/null&&echo busybox)"
[ "$(id -u)" -ne 0 ]&&$BUSYBOX echo -e "'"$Y"'- 正在获取root权限'"$O"'"&&exec su -c sh "$0" "$@"
[ "$(id -u)" -ne 0 ]&&$BUSYBOX echo -e "'"$R"'! 获取root权限失败'"$O"'"&&exit 1
[ "$0" != "${0%/*}" ]&&cd "${0%/*}"
EXEC="/data/adb/'"${2##*/}"'.HGcc"
MD5="'"$($BUSYBOX md5sum "$1.HGcc"|$BUSYBOX head -c 32)"'"
BASE64="'"$($BUSYBOX cat "$1.HGcc"|$BUSYBOX base64)"'"
abort(){
  $BUSYBOX echo -e "
'"$R"'! $@'"$O"'";exit 1
}
output_file(){
  $BUSYBOX echo -e "'"$Y"'- 正在释放脚本'"$O"'"
  $BUSYBOX echo -e "$BASE64"|$BUSYBOX base64 -d>"$EXEC"||abort "脚本释放失败"
  $BUSYBOX chmod 555 "$EXEC"||abort "脚本权限修改失败"
}
check_exec(){
  if [ -x "$EXEC" ]&&[ "$($BUSYBOX md5sum "$EXEC"|$BUSYBOX head -c 32)" = "$MD5" ];then
    $BUSYBOX echo -e "'"$G"'- 脚本校验成功，开始执行'"$O"'"
    "$EXEC" "$(pwd)" "${0##*/}"||abort "脚本执行失败"
  else
    output_file;check_exec
  fi
}
check_exec'>"$2"
$BUSYBOX echo -en "version=$($BUSYBOX cat "$1"|sed -n s/^VERSION=//p)
name=$($BUSYBOX cat "$1"|sed -n s/^NAME=//p)
md5=$($BUSYBOX md5sum "$2"|$BUSYBOX head -c 32)">"${2%/*}/version"
$BUSYBOX cat "${2%/*}/version"
$BUSYBOX echo -e "

$G- 打包完成$O"