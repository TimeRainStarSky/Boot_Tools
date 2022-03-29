#Boot_Tools 在线TWRP下载脚本 作者：时雨🌌星空
[ "$1" = "verify" ]&&{
VERSION="2022-03-29-1";PROTOCOL="v1"
if [ "$(echo "$2-$PROTOCOL"|base64|md5sum|head -c 32)" = "$3" ];then
  echo "VERIFY=$(echo "$3-$PROTOCOL"|base64|md5sum|head -c 32) VERSION=$VERSION";exit
else
  echo "传入参数不正确";exit 1
fi;}
check_device(){ case "$1" in
  "alioth")
    DEVICENAME="Redmi K40"
    RECNAME="3.6.1_11-RedmiK40_v3.4_A12-alioth-skkk_49fc7a15.img"
    URL="http://124.222.200.56/TWRP/alioth/3.6.1_11-RedmiK40_v3.4_A12-alioth-skkk_49fc7a15.img"
    MD5="49fc7a15e824a6b6135322143e635932"
    ;;
  "thyme")
    DEVICENAME="Mi 10S"
    RECNAME="3.6.1_11-Mi10S_v3.4_A12-thyme-skkk_6c87a334.img"
    URL="http://124.222.200.56/TWRP/thyme/3.6.1_11-Mi10S_v3.4_A12-thyme-skkk_6c87a334.img"
    MD5="6c87a334668382e7ad0970612fb147e4"
    ;;
  *)echo "
$R! 不支持的机型：$1$O 请向作者反馈

$C  (1)$O查看机型列表 $C(*)$O返回";choose choose_device
esac;echo "
  当前机型为：$C$DEVICENAME ($1)$O

$C  (1)$O切换机型 $C(*)$O开始下载";choose choose_device download_twrp;}
choose_device(){ echo -n "
$C- 请选择机型：$O

$C  (1)$O Redmi K40	(alioth)
$C  (2)$O Mi 10S	(thyme)
$C  (3)$O 敬请期待	(3)
$C  (4)$O 敬请期待	(4)
$C  (5)$O 敬请期待	(5)
$C  (6)$O 敬请期待	(6)
$C  (7)$O 敬请期待	(7)
$C  (8)$O 敬请期待	(8)
$C  (9)$O 敬请期待	(9)
$C  (*)$O 返回

$C- 请输入你的选择：$O";read MAIN;echo "$MAIN">>"$DIR/.log"
  case "$MAIN" in
  "1")check_device alioth;;
  "2")check_device thyme;;
  "3")check_device 3;;
  "4")check_device 4;;
  "5")check_device 5;;
  "6")check_device 6;;
  "7")check_device 7;;
  "8")check_device 8;;
  "9")check_device 9;;
  *)design;main
  esac;}
abort_download_twrp(){ [ -n "$1" ]&&echo "
$R! $2$O";echo "
$R! 下载文件失败，请检查网络，并尝试重新下载，或更换服务器$O

$C  (1)$O重试 $C(*)$O返回";choose download_twrp;}
download_twrp(){ echo "
$Y- 开始下载$O
"
  eval geturl "$URL"||abort_download_twrp
  [ "$(md5sum "$RECNAME"|head -c 32)" != "$MD5" ]&&abort_download_twrp "下载文件校验错误"
  [ -f "$DIR/rec.img" ]&&{ mv -vf "$DIR/rec.img" "$DIR/rec.img.bak"||abort "重命名原rec.img失败";}
  mv -vf "$TMP/$RECNAME" "$DIR/rec.img"||abort "移动下载TWRP到脚本路径失败"
  rm -rf "$TMP"||abort "删除缓存文件夹失败"
  echo "
$G- TWRP下载完成$O";update_ramdisk;}
echo "
  感谢：$C火柴ANKs$G(提供下载服务器)$O

$Y- 正在检测机型$O";check_device "$DEVICE"