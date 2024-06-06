# pppwn_openwrt
通过openwrt路由器注入PPPwn，给PS4运行GoldHEN越狱

openwrt自动运行pppwn，整合兼容openwrt路由aarch64和mips和arm(cortex_a7)和arm(pi_zero_w)和x86_64包,其他架构可手动下载对应的pppwn，兼容PS4(v9.00/10.00/10.01/11.00）,

访问下面的地址可以到运行日志和重启pppwn服务：
http://<路由器IP>/pppwn.html

pppwn启动默认设置监听了所有的lan端口，如果想要监听特定的lan端口，可安装后自行修改/etc/init.d/pppwn文件，将br-lan改为需要的lan口。
如果要更新pppwn，可从最下方预编译版本链接中下载自己CPU架构对应的pppwn，替换掉/usr/bin/pppwn文件，然后重启路由器或者重启pppwn服务。
重启pppwn可以在路由器web控制台或者命令行控制台执行。命令行控制台重启命令为：
/etc/init.d/pppwn stop
/etc/init.d/pppwn start

安装解压软件包：
opkg update

opkg install tar gzip

解压并执行安装：
tar xf pppwn_openwrt*.tgz
cd pppwn_openwrt
./install.sh

安装包兼容9.00 / 10.00 / 10.01版本，修改install.sh文件中的FIRMWARE=1100为对应的FIRMWARE版本，
9.00: FIRMWARE=900
10.00: FIRMWARE=1000
10.01: FIRMWARE=1001
然后执行安装即可。

pppwn_cpp 预编译版本下载：
https://nightly.link/xfangfang/PPPwn_cpp/workflows/ci.yaml/main?status=completed

文字说明：
https://b23.tv/VjC3o9e

致谢：
xfangfang:  https://github.com/xfangfang/PPPwn_cpp
CodeInvers3: https://github.com/CodeInvers3/PPPwn_ow
EmuMaster：https://www.bilibili.com/video/BV1Ft421u7X4/
