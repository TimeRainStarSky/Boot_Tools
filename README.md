# V-AB分区设备一键安装Recovery和Magisk脚本

## 使用说明
- V-AB分区的设备会有两个系统分区，平时使用其中一个，更新系统时更新到另一个分区，然后重启进入新分区。它的好处是更新系统时手机处于正常开机状态，如果更新失败，可以切换回旧系统分区。它的坏处是把Recovery移动到了boot分区里，安装第三方Recovery会变得更加麻烦。本脚本就是用于在系统更新后一键安装Recovery和Magisk。

- 系统更新有两种方式，增量包更新和完整包更新。完整包更新时会下载完整的系统包，与原来的系统无关。增量包更新，是下载新系统与原系统不同的部分进行更新，所以需要验证原系统是否被修改。

- 当安装了Recovery和Magisk后，完整包更新不受到影响，完整包更新后直接使用本脚本刷入即可。增量包更新则不能安装，由于Recovery+Magisk只修改了boot里的ramdisk，所以只需要备份原版boot，在更新前恢复原版boot，就能完成更新，更新完成之后再备份最新的boot文件，确保下次更新时能正常恢复boot后，刷入修改后的ramdisk即可。

- 由于使用本脚本的要求是安装了Magisk，所以boot已经被修改了，这时候你可以进行一次完整包更新，就可以获得boot备份，之后进行增量包更新即可，或者正常安装Magisk的情况下，提供了boot备份，只需要在Magisk APP内选择 卸载Magisk 还原原厂镜像，之后进行增量包更新即可。

## 步骤总结：

### 1.完整包更新：
```
(1)直接下载完整包进行更新
(2)运行脚本，选择刷入ramdisk
```
### 2.增量包更新：
```
(1)运行脚本，选择恢复boot
(2)下载增量包进行更新
(3)运行脚本，选择备份boot
(4)运行脚本，选择刷入ramdisk
```
### ! 若没有boot备份或更新失败时：
```
(1)下载完整包进行更新
(2)运行脚本，选择备份boot
(3)运行脚本，选择刷入ramdisk
(4)下次再尝试增量包更新
```
! 注意：玩机有风险，刷机需谨慎

使用本脚本出现问题，可以联系作者帮忙，但作者不负任何责任

## 联系方式
### 时雨丶星空
- GitHub：[TimeRainStarSky](https://github.com/TimeRainStarSky)
- 酷安：[时雨丶星空](http://www.coolapk.com/u/2650948)
- QQ：[2536554304](https://qm.qq.com/cgi-bin/qm/qr?k=x8LtlP8vwZs7qLwmsbCsyLoAHy7Et1Pj)
- Telegram：[TimeRainStarSky](https://t.me/TimeRainStarSky)
### 筱寂XIAOJI
- GitHub：[Awstme](https://github.com/Awstme)
- 酷安：[筱寂XIAOJI](http://www.coolapk.com/u/2806404)
