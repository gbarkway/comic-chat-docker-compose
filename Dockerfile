FROM solarkennedy/wine-x11-novnc-docker
RUN apt-get update && \
  apt-get -y install cabextract && \
  wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -O /root/winetricks && \
  chmod +x /root/winetricks && \
  /root/winetricks riched20 corefonts
COPY ["./mschat25.exe", "./run.sh", "/root/"]
COPY ["./menu", "/root/.fluxbox/"]
RUN chmod +x /root/run.sh


