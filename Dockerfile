FROM debian
MAINTAINER leejoneshane@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get --fix-missing update \
    && apt-get -y --no-install-recommends install zip unzip bzip2 lzop pigz pbzip2 rsync disktype parted pciutils tcpdump net-tools dialog bc gawk hdparm sdparm netcat file ethtool etherwake ssh syslinux isolinux pxelinux mtools reiserfsprogs psmisc binutils apt-utils locales fonts-wqy-zenhei hime wget txt2html dosfstools tftpd-hpa nfs-kernel-server nis curl lftp iptables memtest86+ ntfs-3g \
    && echo "zh_TW.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen "zh_TW.UTF-8" \
    && dpkg-reconfigure locales \
    && echo "deb http://free.nchc.org.tw/debian/ jessie main" >> /etc/apt/sources.list \
    && echo "deb http://free.nchc.org.tw/drbl-core drbl stable" >> /etc/apt/sources.list \
    && wget -q http://drbl.nchc.org.tw/GPG-KEY-DRBL -O- | apt-key add - \
    && mkdir -p /run/sendsigs.omit.d
    
RUN apt-get -y --no-install-recommends install drbl clonezilla partclone ipxe lvm2 genisoimage lshw hwinfo aoetools vblade dmidecode lzma xz-utils pxz pixz lzip lbzip2 plzip lrzip pv hfsutils hfsprogs dmsetup dmraid kpartx tofrodos dos2unix isc-dhcp-server gdisk btrfs-tools efibootmgr \
    && apt-get clean all
    

ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.utf-8
ENV LC_ALL zh_TW.UTF-8

VOLUME ["/etc/exports", "/tftpboot", "/home/partimag"]
EXPOSE 68/udp 111/udp 2049/tcp
CMD ["/bin/bash"]
