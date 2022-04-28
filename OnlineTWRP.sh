#Boot_Tools 在线TWRP下载数据脚本 作者：时雨🌌星空
ONLINEVERSION="2022-04-28-1";MINIVER="202204280"
check_device(){ SERVER="https://trss.coding.net/p/TWRP/d/TWRP/git/raw/main"
  case "$1" in
  "alioth")
    DEVICENAME="Redmi K40"
    RECNAME="3.6.1_11-RedmiK40_v3.4_A12-alioth-skkk_49fc7a15-cleaned.img.xz"
    MD5="7e84684dd37c5faf6e450963d0229781"
    ;;
  "thyme")
    DEVICENAME="Mi 10S"
    RECNAME="3.6.1_11-Mi10S_v3.4_A12-thyme-skkk_6c87a334-cleaned.img.xz"
    MD5="6034d857f7a63f6b0f1bc7445020fccb"
    ;;
  "munch")
    DEVICENAME="Redmi K40S"
    RECNAME="3.6.1_11-RedmiK40S_v3.4_A12-munch-skkk_3dee7e7f-cleaned.img.xz"
    MD5="e4f975911a132ffe2dc8c4731f080f58"
    ;;
  "haydn")
    DEVICENAME="Redmi K40 Pro"
    RECNAME="twrp-3.6.1_11-0-haydn-cleaned.img.xz"
    MD5="896d259ad5845b357a8a09db9023b11c"
    ;;
  "venus")
    DEVICENAME="Mi 11"
    RECNAME="twrp-3.6.1_11-0-venus-cleaned.img.xz"
    MD5="8745acf96962a5c9bed454e3dd6091ac"
    ;;
  "mars")
    DEVICENAME="Mi 11 Pro"
    RECNAME="twrp-3.6.1_11-0-mars-cleaned.img.xz"
    MD5="4cfda2bcebd36b141c70a3bece49a329"
    ;;
  "star")
    DEVICENAME="Mi 11 Ultra"
    RECNAME="twrp-3.6.1_11-0-star-cleaned.img.xz"
    MD5="fe1c8b215446ec709fb9f08c429c8fe3"
    ;;
  "renoir")
    DEVICENAME="Mi 11 Lite"
    RECNAME="twrp-3.6.1_11-0-renoir-cleaned.img.xz"
    MD5="377889db2952865063057419cb62140c"
    ;;
  "odin")
    DEVICENAME="Mi MIX 4"
    RECNAME="twrp-3.6.1_11-0-odinx-cleaned.img.xz"
    MD5="5aa1a1c1ec788a0390a1feae3bf25061"
    ;;
  *)echo "
$R! 不支持的机型：$1$O

  适配请加群：${C}211414032$O

$C  (1)$O查看机型列表 $C(*)$O返回";choose choose_device
esac
  URL="$SERVER/$1/$RECNAME"
  echo "
  当前机型为：$C$DEVICENAME ($1)$O

$C  (1)$O切换机型 $C(*)$O开始下载";choose choose_device download_twrp;}
choose_device(){ echo -n "
$C- 请选择机型：$O

$C  (1)$O Redmi K40     (alioth)
$C  (2)$O Redmi K40S    (munch)
$C  (3)$O Redmi K40 Pro (haydn)
$C  (4)$O Mi 10S        (thyme)
$C  (5)$O Mi 11         (venus)
$C  (6)$O Mi 11 Pro     (mars)
$C  (7)$O Mi 11 Ultra   (star)
$C  (8)$O Mi 11 Lite    (renoir)
$C  (9)$O Mi MIX 4      (odin)
$C  (0)$O 返回

$C- 请输入你的选择：$O";read CHOOSE;echo "$CHOOSE">>"$DIR/.log"
  case "$CHOOSE" in
  "0")design;main;;
  "1")check_device alioth;;
  "2")check_device munch;;
  "3")check_device haydn;;
  "4")check_device thyme;;
  "5")check_device venus;;
  "6")check_device mars;;
  "7")check_device star;;
  "8")check_device renoir;;
  "9")check_device odin;;
  *)check_device "$CHOOSE"
  esac;}
abort_download_twrp(){ [ -n "$1" ]&&echo "
$R! $2$O";echo "
$R! 下载文件失败，请检查网络，并尝试重新下载，或更换服务器$O

$C  (1)$O重试 $C(*)$O返回";choose download_twrp;}
download_twrp(){ echo "
$Y- 开始下载TWRP$O
";mktmp;eval geturl "$URL">"$TMP/rec.img.xz"||abort_download_twrp
  [ "$(md5sum "$TMP/rec.img.xz"|head -c 32)" != "$MD5" ]&&abort_download_twrp "下载文件校验错误"
  [ -f "$DIR/rec.img" ]&&{ mv -vf "$DIR/rec.img" "$DIR/rec.img.bak"||abort "重命名原rec.img失败";}
  xzcat "$TMP/rec.img.xz">"$DIR/rec.img"||{ [ -f "$DIR/rec.img.bak" ]&&mv -vf "$DIR/rec.img.bak" "$DIR/rec.img";abort "下载文件解压失败";}
  echo "
$G- TWRP下载完成$O";update_ramdisk;}
[ "$1" = "verify" ]&&{ PROTOCOL="v1"
if [ "$(echo "$2-$PROTOCOL"|base64|md5sum|head -c 32)" = "$3" ];then
  echo "VERIFY=$(echo "$3-$PROTOCOL"|base64|md5sum|head -c 32) VERSION=$ONLINEVERSION";exit
else
  echo "传入参数不正确";exit 1
fi;}
[ -n "$VERSION" ]&&[ -n "$NAME" ]||{ echo "[1;31m! 脚本不支持独立运行，请配合Boot_Tools脚本使用[m";exit 1;}
[ "$VERSION" -lt "$MINIVER" ]&&{ echo "
$R! Boot_Tools版本过低，请更新后重试$O";update;exit;}
echo "
$Y- 正在检测机型$O";check_device "$DEVICE"