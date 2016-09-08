FROM leejoneshane/drbl
MAINTAINER leejoneshane@gmail.com

ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.utf-8
ENV LC_ALL zh_TW.UTF-8

VOLUME ["/etc/exports", "/tftpboot", "/home/partimag"]
EXPOSE 68/udp 111/udp 2049/tcp
CMD ["dcs"]
