#!/bin/ash
WORKDIR=$(dirname $0)
#FIRMWARE=900
#FIRMWARE=960
#FIRMWARE=1000
FIRMWARE=1001
#FIRMWARE=1100
ARCH=$(uname -m)

if [ "$ARCH" == "aarch64" ]
then
    cp ${WORKDIR}/bin/pppwn_aarch /usr/bin/pppwn
    chmod +x /usr/bin/pppwn
elif [ "$ARCH" == "arm_a7" ]
then
    cp ${WORKDIR}/bin/pppwn_a7 /usr/bin/pppwn
    chmod +x /usr/bin/pppwn
elif [ "$ARCH" == "arm_pi" ]
then
    cp ${WORKDIR}/bin/pppwn_pi /usr/bin/pppwn
    chmod +x /usr/bin/pppwn
elif [ "$ARCH" == "mips" ]
then
    cp ${WORKDIR}/bin/pppwn_mips /usr/bin/pppwn
    chmod +x /usr/bin/pppwn
elif [ "$ARCH" == "x86_64" ]
then
    cp ${WORKDIR}/bin/pppwn_x64 /usr/bin/pppwn
    chmod +x /usr/bin/pppwn
else
    echo "$ARCH version pppwn_cpp not found." 
    echo "Your can try to download from :"
    echo "https://nightly.link/xfangfang/PPPwn_cpp/workflows/ci.yaml/main?status=completed"
    echo "And extract pppwn to /usr/bin/pppwn"
    read -p "Continue? [yes|no]" answer
    if [ "x${answer}" == "xyes" ]
    then
        echo "Continue to install..."
    else
        echo "Quit install..."
    fi
fi

echo "Installing..."
#sed -i 's_downloads.openwrt.org_mirrors.tuna.tsinghua.edu.cn/openwrt_' /etc/opkg/distfeeds.conf
#opkg update
#opkg install kmod-ppp kmod-pppoe kmod-pppox rsync
#rsync -av pppwn/ /
cp -r ${WORKDIR}/pppwn/* /
sed -i 's/^VERSION=.*/VERSION='"${FIRMWARE}"'/' /etc/init.d/pppwn
chmod +x /etc/init.d/pppwn
chmod +x /www/cgi-bin/pw.cgi
/etc/init.d/pppwn enable
/etc/init.d/pppwn start
echo "Installation complete."
