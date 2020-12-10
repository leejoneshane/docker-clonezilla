FROM debian:jessie
MAINTAINER leejoneshane@gmail.com

ENV DEBIAN_FRONTEND noninteractive
ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.utf-8
ENV LC_ALL zh_TW.UTF-8

RUN echo "zh_TW.UTF-8 UTF-8" > /etc/locale.gen \
    && apt-get update \
    && apt-get -y --no-install-recommends install locales wget curl gnupg apt-utils dialog \
    && echo "deb http://free.nchc.org.tw/drbl-core drbl stable" >> /etc/apt/sources.list \
    && wget -q http://drbl.nchc.org.tw/GPG-KEY-DRBL -O- | apt-key add - \
    && apt-get update \
    && echo "\n" | apt-get -y --no-install-recommends install zip unzip bzip2 pigz rsync disktype parted pciutils tcpdump \
                  net-tools bc gawk hdparm sdparm netcat file ethtool etherwake ssh syslinux isolinux pxelinux mtools \
                  reiserfsprogs psmisc binutils fonts-wqy-zenhei hime txt2html dosfstools tftpd-hpa \
                  nfs-kernel-server nis lftp iptables memtest86+ ntfs-3g lvm2 genisoimage lshw hwinfo aoetools \
                  vblade dmidecode lzma xz-utils pixz lzip lbzip2 plzip lrzip pv hfsutils hfsprogs libnss3 \
                  dmraid kpartx tofrodos dos2unix isc-dhcp-server gdisk btrfs-tools efibootmgr libxft2 libxmu6 \
                  debconf-utils discover discover-data expect kmod libdiscover2 libdrm-intel1 \
                  libdrm-nouveau2 libdrm-radeon1 libdrm2 libelf1 libfontenc1 libfribidi0 libgl1-mesa-dri libgl1-mesa-glx \
                  libglapi-mesa libice6 libnewt0.52 libxmuu1 libxpm4 libxshmfence1 libxss1 \
                  libpciaccess0 libsm6 libtcl8.6 libtk8.6 libtxc-dxtn-s2tc0 libutempter0 libx11-xcb1 libxt6 libxv1 \
                  libxxf86dga1 libxxf86vm1 patch tcl-expect tcl8.6 tk8.6 traceroute x11-utils xbitmaps xterm \
                  libxaw7 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-shape0 libxcb-sync1 \
                  lzop nmap freedos mkpxeinitrd-net partimage partclone apparmor busybox cpio firmware-linux-free \
                  initramfs-tools libmpdec2 python3 linux-base ecryptfs-utils \
                  chntpw dns-root-data dnsmasq dnsmasq-base grub-common grub-efi-amd64-bin grub-efi-ia32-bin ipxe \
                  ldmtool libburn4 libisoburn1 libisofs6 libjson-glib-1.0-0 libjson-glib-1.0-common libjte1 \
                  libldm-1.0-0 libmnl0 libnetfilter-conntrack3 monitoring-plugins-basic monitoring-plugins-common \
                  nscd os-prober pbzip2 syslinux-utils thin-provisioning-tools xorriso \
                  irqbalance libcap-ng0 libnuma1 linux-image-4.9.0-0.bpo.12-amd64 \
                  linux-image-amd64 drbl drbl-chntpw clonezilla \
    && mkdir -p /run/sendsigs.omit.d \
    && drblsrv -s -f -l 2 -i

VOLUME ["/tftpboot", "/home/partimag"]
EXPOSE 68/udp 111/udp 2049/tcp
CMD ["drbl-all-service start"]
