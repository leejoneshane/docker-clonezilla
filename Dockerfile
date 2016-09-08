FROM debian
MAINTAINER leejoneshane@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get -y --no-install-recommends install util-linux tar zip unzip gzip bzip2 lzop pigz pbzip2 procps rsync disktype parted pciutils tcpdump net-tools dialog bc gawk hdparm sdparm netcat file ethtool etherwake ssh syslinux isolinux pxelinux mtools reiserfsprogs psmisc binutils apt-utils locales fonts-wqy-zenhei hime wget txt2html dosfstools initscripts tftpd-hpa nfs-kernel-server nis curl lftp iptables memtest86+ ntfs-3g \
    && echo "zh_TW.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen "zh_TW.UTF-8" \
    && dpkg-reconfigure locales \
    && echo "deb http://free.nchc.org.tw/debian/ jessie main" >> /etc/apt/sources.list \
    && echo "deb http://free.nchc.org.tw/drbl-core drbl stable" >> /etc/apt/sources.list \
    && wget -q http://drbl.nchc.org.tw/GPG-KEY-DRBL -O- | apt-key add - \
    && apt-get -y --no-install-recommends install drbl clonezilla mkswap-uuid partclone drbl-chntpw mkpxeinitrd-net ipxe freedos mkinitrd lvm2 genisoimage lshw hwinfo aoetools vblade dmidecode lzma xz xz-utils pxz pixz lzip lbzip2 plzip lrzip pv hfsutils hfsprogs dmsetup dmraid kpartx device-mapper tofrodos dos2unix unix2dos isc-dhcp-server gdisk btrfs-tools ufsutils efibootmgr \
    && apt-get clean all \
    && mkdir -p /run/sendsigs.omit.d

ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.utf-8
ENV LC_ALL zh_TW.UTF-8

VOLUME ["/etc/exports", "/tftpboot", "/home/partimag"]
EXPOSE 68/udp 111/udp 2049/tcp
CMD ["/bin/bash"]
