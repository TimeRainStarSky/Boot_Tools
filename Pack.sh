#!/system/bin/sh
R="\e[1;31m"
G="\e[1;32m"
Y="\e[1;33m"
C="\e[1;36m"
B="\e[1;m"
O="\e[m"
[ "$(id -u)" -ne 0 ]&&echo -e "$Y- 正在获取root权限$O"&&exec su -c sh "$0" "$@"
[ "$(id -u)" -ne 0 ]&&echo -e "$R! 获取root权限失败$O"&&exit 1
PATH=/data/adb/magisk:"$(magisk --path)":/system/bin:"$PATH"
E="$(busybox &>/dev/null&&echo busybox)"
$E echo -e "$B************************
$R HGcc$G Script$Y Pack$C Tools$O
************************
    $G酷安：$C时雨丶星空$O"
[ ! -f "$1" ]&&$E echo -e "$R! $1文件不存在$O"&&exit 1
[ -z "$(which HGcc 2>/dev/null)" ]&&$E echo -e "$R! HGcc编译器不存在$O"&&exit 1
$E echo -e "
$Y- 正在使用HGcc编译脚本$O
"
HGcc -r "$1" "$1.HGcc"
$E echo -e "
$Y- 正在打包为自释放脚本$O
"
$E echo -en '#脚本已经过编译，需要源代码请联系作者：时雨丶星空
[ "$(id -u)" -ne 0 ]&&echo -e "'"$Y"'- 正在获取root权限'"$O"'"&&exec su -c sh "$0" "$@"
[ "$(id -u)" -ne 0 ]&&echo -e "'"$R"'! 获取root权限失败'"$O"'"&&exit 1
PATH=/data/adb/magisk:"$(magisk --path)":/system/bin:"$PATH"
E="$(busybox &>/dev/null&&echo busybox)"
[ "$0" != "${0%/*}" ]&&cd "${0%/*}"
EXEC="/data/adb/'"${2##*/}"'.HGcc"
MD5="'"$($E md5sum "$1.HGcc"|$E head -c 32)"'"
BASE64="'"$($E cat "$1.HGcc"|$E base64)"'"
abort(){
  $E echo -e "
'"$R"'! $@'"$O"'";exit 1
}
output_file(){
  $E echo -e "'"$Y"'- 正在释放脚本'"$O"'"
  $E echo -e "$BASE64"|$E base64 -d>"$EXEC"||abort "脚本释放失败"
  $E chmod 555 "$EXEC"||abort "脚本权限修改失败"
}
check_exec(){
  if [ -x "$EXEC" ]&&[ "$($E md5sum "$EXEC"|$E head -c 32)" = "$MD5" ];then
    $E echo -e "'"$G"'- 脚本校验成功，开始执行'"$O"'"
    "$EXEC" "$(pwd)" "${0##*/}"||abort "脚本执行失败"
  else
    output_file;check_exec
  fi
}
check_exec'>"$2"
$E echo -en "version=$($E cat "$1"|sed -n s/^VERSION=//p)
name=$($E cat "$1"|sed -n s/^NAME=//p)
md5=$($E md5sum "$2"|$E head -c 32)">"${2%/*}/version"
$E cat "${2%/*}/version"
$E echo -e "

$G- 打包完成$O"