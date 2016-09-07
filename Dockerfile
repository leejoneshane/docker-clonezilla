FROM debian
MAINTAINER leejoneshane@gmail.com

RUN apt-get update \
    && apt-get -y --no-install-recommends install net-tools bc gawk binutils apt-utils locales fonts-wqy-zenhei hime drbl \
    && apt-get clean \
    && echo "zh_TW.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen "zh_TW.UTF-8" \
    && dpkg-reconfigure locales \

ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.utf-8
ENV LC_ALL zh_TW.UTF-8

ADD drbl.sh /usr/sbin/drbl.sh
RUN chmod +x /usr/sbin/drbl.sh
VOLUME ["/etc/exports", "/tftpboot", "/home/partimag"]
EXPOSE 68 111 2049
CMD ["/usr/sbin/drbl.sh"]
