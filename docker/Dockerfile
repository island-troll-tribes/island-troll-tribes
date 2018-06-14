FROM microsoft/powershell

RUN dpkg --add-architecture i386

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    apt-transport-https \
    software-properties-common \
    python-software-properties \
    wget \
    telnet \
    cabextract \
 && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://dl.winehq.org/wine-builds/Release.key \
 && apt-key add Release.key \
 && apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/

RUN apt-get update \
 && apt-get install -y --install-recommends winehq-stable \
 && rm -rf /var/lib/apt/lists/*

ENV WINEARCH="win32"
ENV WINEPREFIX="/root/.wine32"

RUN mkdir -p $WINEPREFIX \
 && cd $WINEPREFIX \
 && wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
 && chmod +x winetricks \
 && wine wineboot --init \
 && sh ./winetricks d3dx9 corefonts