shc -vf "$1"
echo -n '#脚本已加密，需要源代码请联系作者：时雨丶星空
test "$(id -u)" -ne 0&&exec su -c sh "$0"
test "$(id -u)" -ne 0&&echo "\e[1;31m! 获取root权限失败\e[m"&&exit
[ "$0" != "${0%/*}" ]&&cd "${0%/*}"
EXEC="/data/adb/Boot_Tools.x"
MD5="'"$(md5sum "$1.x"|head -c 32)"'"
BASE64="'"$(cat "$1.x"|base64)"'"
output_file(){
echo "\e[1;33m- 正在释放文件\e[m"
echo "$BASE64"|base64 -d>"$EXEC"
chmod 755 "$EXEC"
}
check_exec(){
if [ -x "$EXEC" ]&&[ "$(md5sum "$EXEC"|head -c 32)" == "$MD5" ];then
  exec "$EXEC" "$(pwd)" "${0##*/}"
else
  output_file
  sleep 1
  check_exec
fi
}
check_exec'>"$2"
echo -n "version=$(cat "$1"|sed -n s/^VERSION=//p)
name=$(cat "$1"|sed -n s/^NAME=//p)
md5=$(md5sum "$2"|head -c 32)">"${2%/*}/version"