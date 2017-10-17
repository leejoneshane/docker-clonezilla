# docker-clonezilla
[![](https://images.microbadger.com/badges/version/leejoneshane/drbl-server.svg)](http://microbadger.com/images/leejoneshane/drbl-server "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/leejoneshane/drbl-server.svg)](http://microbadger.com/images/leejoneshane/drbl-server "Get your own image badge on microbadger.com")

This docker image is contained DRBL and clonezilla server.

# About DRBL

DRBL (Diskless Remote Boot in Linux) is free software, open source solution to managing the deployment of the GNU/Linux operating system across many clients. Imagine the time required to install GNU/Linux on 40, 30, or even 10 client machines individually! DRBL allows for the configuration all of your client computers by installing just one server (remember, not just any virtual private server) machine.

DRBL provides a diskless or systemless environment for client machines. It works on Debian, Ubuntu, Red Hat, Fedora, CentOS and SuSE. DRBL uses distributed hardware resources and makes it possible for clients to fully access local hardware. It also includes Clonezilla, a partitioning and disk cloning utility similar to True Image® or Norton Ghost®.

The features of DRBL:
1. Peacefully coexists with other OS
2. Simply install DRBL on a single server and all your clients are taken care of
3. Save on hardware, budget, and maintenance fees

# What is Clonezilla?

Clonezilla is a partition and disk imaging/cloning program similar to True Image® or Norton Ghost®. It helps you to do system deployment, bare metal backup and recovery. Two types of Clonezilla are available, Clonezilla live and Clonezilla SE (server edition). Clonezilla live is suitable for single machine backup and restore. While Clonezilla SE is for massive deployment, it can clone many (40 plus!) computers simultaneously. Clonezilla saves and restores only used blocks in the hard disk. This increases the clone efficiency. With some high-end hardware in a 42-node cluster, a multicast restoring at rate 8 GB/min was reported.

Features:
1. Many File systems are supported: (1) ext2, ext3, ext4, reiserfs, reiser4, xfs, jfs, btrfs, f2fs and nilfs2 of GNU/Linux, (2) FAT12, FAT16, FAT32, NTFS of MS Windows, (3) HFS+ of Mac OS, (4) UFS of FreeBSD, NetBSD, and OpenBSD, (5) minix of Minix, and (6) VMFS3 and VMFS5 of VMWare ESX. Therefore you can clone GNU/Linux, MS windows, Intel-based Mac OS, FreeBSD, NetBSD, OpenBSD, Minix, VMWare ESX and Chrome OS/Chromium OS, no matter it's 32-bit (x86) or 64-bit (x86-64) OS. For these file systems, only used blocks in partition are saved and restored by Partclone. For unsupported file system, sector-to-sector copy is done by dd in Clonezilla.
2. LVM2 (LVM version 1 is not) under GNU/Linux is supported.
3. Boot loader, including grub (version 1 and version 2) and syslinux, could be reinstalled.
4. Both MBR and GPT partition formats of hard drive are supported. Clonezilla live also can be booted on a BIOS or uEFI machine.
5. Unattended mode is supported. Almost all steps can be done via commands and options. You can also use a lot of boot parameters to customize your own imaging and cloning.
6. One image restoring to multiple local devices is supported.
7. Image could be encrypted. This is done with ecryptfs, a POSIX-compliant enterprise cryptographic stacked filesystem.
8. Multicast is supported in Clonezilla SE, which is suitable for massive clone. You can also remotely use it to save or restore a bunch of computers if PXE and Wake-on-LAN are supported in your clients.
9. The image file can be on local disk, ssh server, samba server, NFS server or WebDAV server.
10. AES-256 encryption could be used to secures data access, storage and transfer.
11. Based on Partclone (default), Partimage (optional), ntfsclone (optional), or dd to image or clone a partition. However, Clonezilla, containing some other programs, can save and restore not only partitions, but also a whole disk.
12. By using another free software drbl-winroll, which is also developed by us, the hostname, group, and SID of cloned MS windows machine can be automatically changed.

# How to use
```
docker run --network=host -d leejoneshane/drbl-server
```
