
# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------

FROM        ubuntu:18.04
LABEL       author="DoctaEnkoda" maintainer="bierquejason@gmail.com"

RUN         dpkg --add-architecture i386 \
            && apt-get update -y \
            && apt-get upgrade -y \
            && apt-get install -y -no-install-recommends sudo tar wget curl gcc g++ lib32gcc1 libgcc1 libcurl4-gnutls-dev:i386 libssl1.0.0:i386 \
            && apt-get install -y -no-install-recommends libcurl4:i386 lib32tinfo5 libtinfo5:i386 lib32z1 lib32stdc++6 libncurses5:i386 \
            && apt-get install -y -no-install-recommends libcurl3-gnutls:i386 iproute2 gdb libsdl1.2debian libfontconfig telnet net-tools netcat \
            && apt-get install -y -no-install-recommends build-essential cmake zip unzip \
            
            && useradd -m -d /home/container container
