#Boot_Tools 在线TWRP下载数据脚本 作者：时雨🌌星空
ONLINEVERSION="2022-04-08-1"
check_device(){ SERVER="https://gitee.com/TimeRainStarSky/TWRP"
  case "$1" in
  "alioth")
    DEVICENAME="Redmi K40"
    RECNAME="3.6.1_11-RedmiK40_v3.4_A12-alioth-skkk_49fc7a15.img.xz"
    MD5="ac57cd9a68dd9176eb283c02669515b3"
    ;;
  "thyme")
    DEVICENAME="Mi 10S"
    RECNAME="3.6.1_11-Mi10S_v3.4_A12-thyme-skkk_6c87a334.img.xz"
    MD5="b01fe65236fee66e9502bd6ed75e6fa5"
    ;;
  "haydn")
    DEVICENAME="Redmi K40 Pro"
    RECNAME="twrp-3.6.1_11-0-haydn.img.xz"
    MD5="dc638727ee822d2d498e780bd010ba66"
    ;;
  "venus")
    DEVICENAME="Mi 11"
    RECNAME="twrp-3.6.1_11-0-venus.img.xz"
    MD5="03b6c887e59a8628713a9798212bebe7"
    ;;
  "mars")
    DEVICENAME="Mi 11 Pro"
    RECNAME="twrp-3.6.1_11-0-mars.img.xz"
    MD5="1e43059b303d62f1012ee7db1ecf88f1"
    ;;
  "star")
    DEVICENAME="Mi 11 Ultra"
    RECNAME="twrp-3.6.1_11-0-star.img.xz"
    MD5="dc1050ca9f94d24462d408dff23ad854"
    ;;
  "renoir")
    DEVICENAME="Mi 11 Lite"
    RECNAME="twrp-3.6.1_11-0-renoir.img.xz"
    MD5="286273888c0d839d4de9fcafb62baaed"
    ;;
  "odin")
    DEVICENAME="Mi MIX 4"
    RECNAME="twrp-3.6.1_11-0-odinx.img.xz"
    MD5="cc10553bc4324a0687bc602cf1907427"
    ;;
  *)echo "
$R! 不支持的机型：$1$O 请向作者反馈

$C  (1)$O查看机型列表 $C(*)$O返回";choose choose_device
esac
  URL="$SERVER/$1/$RECNAME"
  echo "
  当前机型为：$C$DEVICENAME ($1)$O

$C  (1)$O切换机型 $C(*)$O开始下载";choose choose_device download_twrp;}
choose_device(){ echo -n "
$C- 请选择机型：$O

$C  (1)$O Redmi K40     (alioth)
$C  (2)$O Redmi K40 Pro (haydn)
$C  (3)$O Mi 10S        (thyme)
$C  (4)$O Mi 11         (venus)
$C  (5)$O Mi 11 Pro     (mars)
$C  (6)$O Mi 11 Ultra   (star)
$C  (7)$O Mi 11 Lite    (renoir)
$C  (8)$O Mi MIX 4      (odin)
$C  (0)$O 返回

$C- 请输入你的选择：$O";read CHOOSE;echo "$CHOOSE">>"$DIR/.log"
  case "$CHOOSE" in
  "0")design;main;;
  "1")check_device alioth;;
  "2")check_device haydn;;
  "3")check_device thyme;;
  "4")check_device venus;;
  "5")check_device mars;;
  "6")check_device star;;
  "7")check_device renoir;;
  "8")check_device odin;;
  *)check_device "$CHOOSE"
  esac;}
abort_download_twrp(){ [ -n "$1" ]&&echo "
$R! $2$O";echo "
$R! 下载文件失败，请检查网络，并尝试重新下载，或更换服务器$O

$C  (1)$O重试 $C(*)$O返回";choose download_twrp;}
download_twrp(){ echo "
$Y- 开始下载TWRP，服务器速度有点慢，请稍等$O
"
  eval geturl "$URL"||abort_download_twrp
  [ "$(md5sum "$RECNAME"|head -c 32)" != "$MD5" ]&&abort_download_twrp "下载文件校验错误"
  xzcat "$RECNAME">rec.img||abort "下载文件解压失败"
  [ -f "$DIR/rec.img" ]&&{ mv -vf "$DIR/rec.img" "$DIR/rec.img.bak"||abort "重命名原rec.img失败";}
  mv -vf rec.img "$DIR/rec.img"||abort "移动下载TWRP到脚本路径失败"
  echo "
$G- TWRP下载完成$O";update_ramdisk;}
[ "$1" = "verify" ]&&{ PROTOCOL="v1"
if [ "$(echo "$2-$PROTOCOL"|base64|md5sum|head -c 32)" = "$3" ];then
  echo "VERIFY=$(echo "$3-$PROTOCOL"|base64|md5sum|head -c 32) VERSION=$ONLINEVERSION";exit
else
  echo "传入参数不正确";exit 1
fi;}
[ -z "$DEVICE" ]&&{ echo "[1;31m! 脚本不支持独立运行，请配合Boot_Tools脚本使用[m";exit 1;}
echo "
  感谢：$C火柴ANKs$G(提供下载服务器)$O

$Y- 正在检测机型$O";check_device "$DEVICE"