FROM docker.io/ubuntu:focal

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ENV WINEVER 5.15

RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get -y install python2 python-is-python2 xvfb x11vnc xdotool wget tar supervisor net-tools fluxbox gnupg2 cabextract
RUN  wget -O - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -  && \
    echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' | tee /etc/apt/sources.list.d/winehq.list && \
    apt-get update && \
    apt-get -y install --install-recommends wine-staging-i386:i386=$WINEVER~focal wine-staging-amd64:amd64=$WINEVER~focal wine-staging:amd64=$WINEVER~focal winehq-staging:amd64=$WINEVER~focal  && \
    mkdir /opt/wine-staging/share/wine/mono && wget -O - https://dl.winehq.org/wine/wine-mono/4.9.4/wine-mono-bin-4.9.4.tar.gz | tar -xzv -C /opt/wine-staging/share/wine/mono && \
    mkdir /opt/wine-staging/share/wine/gecko && wget -O /opt/wine-staging/share/wine/gecko/wine-gecko-2.47.1-x86.msi https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86.msi && \
    wget -O /opt/wine-staging/share/wine/gecko/wine-gecko-2.47.1-x86_64.msi https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86_64.msi && \
    apt-get -y full-upgrade && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV WINEPREFIX /root/prefix32
ENV WINEARCH win32
ENV DISPLAY :0

RUN wget -O /opt/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks && \
    chmod +x /opt/winetricks

ADD TALTAC21131.msi /tmp/TALTAC21131.msi

WORKDIR /root/
RUN wget -O - https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar -xzv -C /root/ && mv /root/noVNC-1.1.0 /root/novnc && ln -s /root/novnc/vnc_lite.html /root/novnc/index.html && \
    wget -O - https://github.com/novnc/websockify/archive/v0.9.0.tar.gz | tar -xzv -C /root/ && mv /root/websockify-0.9.0 /root/novnc/utils/websockify

EXPOSE 8080

ADD run.sh /opt/run.sh
RUN chmod +x /opt/run.sh
CMD ["/opt/run.sh"]
