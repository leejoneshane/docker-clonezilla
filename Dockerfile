FROM debian
MAINTAINER leejoneshane@gmail.com

RUN apt-get update \
    && apt-get -y --no-install-recommends install net-tools bc gawk binutils apt-utils locales fonts-wqy-zenhei hime wget \
    && echo "zh_TW.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen "zh_TW.UTF-8" \
    && dpkg-reconfigure locales \

RUN echo "deb http://free.nchc.org.tw/drbl-core drbl stable" >> /etc/apt/sources.list \
    && wget -q http://drbl.nchc.org.tw/GPG-KEY-DRBL -O- | apt-key add - \
    && apt-get install drbl \
    && apt-get clean \
    && mkdir -p /run/sendsigs.omit.d \
    && drbl4imp -e -p 40 -b

ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.utf-8
ENV LC_ALL zh_TW.UTF-8

RUN chmod +x /usr/sbin/drbl.sh
VOLUME ["/etc/exports", "/tftpboot", "/home/partimag"]
EXPOSE 68/udp 111/udp 2049/tcp
CMD ["dcs"]
