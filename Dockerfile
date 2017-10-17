FROM debian
MAINTAINER leejoneshane@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get --fix-missing update \
    && apt-get -y --no-install-recommends install zip unzip bzip2 pigz rsync disktype parted pciutils tcpdump \
                  net-tools dialog bc gawk hdparm sdparm netcat file ethtool etherwake ssh syslinux isolinux pxelinux mtools \
                  reiserfsprogs psmisc binutils apt-utils locales fonts-wqy-zenhei hime wget txt2html dosfstools tftpd-hpa \
                  nfs-kernel-server nis curl lftp iptables memtest86+ ntfs-3g lvm2 genisoimage lshw hwinfo aoetools \
                  vblade dmidecode lzma xz-utils pxz pixz lzip lbzip2 plzip lrzip pv hfsutils hfsprogs dmsetup \
                  dmraid kpartx tofrodos dos2unix isc-dhcp-server gdisk btrfs-tools efibootmgr libxft2 libxmu6 \
                  debconf-utils discover discover-data expect iproute iputils-ping kmod libdiscover2 libdrm-intel1 \
                  libdrm-nouveau2 libdrm-radeon1 libdrm2 libelf1 libfontenc1 libfribidi0 libgl1-mesa-dri libgl1-mesa-glx \
                  libglapi-mesa libgnutls-openssl27 libice6 libnewt0.52 libxmuu1 libxpm4 libxshmfence1 libxss1 \
                  libpciaccess0 libsm6 libtcl8.6 libtk8.6 libtxc-dxtn-s2tc0 libutempter0 libx11-xcb1 libxt6 libxv1 \
                  libxxf86dga1 libxxf86vm1 partimage patch tcl-expect tcl8.6 tk8.6 traceroute x11-utils xbitmaps xterm \
                  libxaw7 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-shape0 libxcb-sync1 gnupg \
    && echo "zh_TW.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen "zh_TW.UTF-8" \
    && dpkg-reconfigure locales \
    && echo "deb http://free.nchc.org.tw/debian/ jessie main" >> /etc/apt/sources.list \
    && echo "deb http://free.nchc.org.tw/drbl-core drbl stable" >> /etc/apt/sources.list \
    && wget -q http://drbl.nchc.org.tw/GPG-KEY-DRBL -O- | apt-key add - \
    && mkdir -p /run/sendsigs.omit.d \
    && apt-get -y install drbl clonezilla partclone ipxe lzop pigz pbzip2 udpcast \
    && apt-get clean all

ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.utf-8
ENV LC_ALL zh_TW.UTF-8

VOLUME ["/tftpboot", "/home/partimag"]
EXPOSE 68/udp 111/udp 2049/tcp
CMD ["drbl4imp -e -b -p 40"]
