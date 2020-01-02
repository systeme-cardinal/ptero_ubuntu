
# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Source Engine
# Minimum Panel Version: 0.6.0
# ----------------------------------

FROM        ubuntu:18.04
LABEL       author="DoctaEnkoda" maintainer="bierquejason@gmail.com"
ENV TZ=Europe/Paris
ENV DEBIAN_FRONTEND=noninteractive

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN         dpkg --add-architecture i386 \
            && apt-get update -y \
            && apt-get upgrade -y \
            && apt-get install -y sudo tar wget curl gcc g++ lib32gcc1 libgcc1 libcurl4-gnutls-dev:i386 libssl1.0.0:i386 \
            && apt-get install -y libcurl4:i386 lib32tinfo5 libtinfo5:i386 lib32z1 lib32stdc++6 libncurses5:i386 \
            && apt-get install -y libcurl3-gnutls:i386 iproute2 gdb libsdl1.2debian libfontconfig telnet net-tools netcat \
            && apt-get install -y build-essential cmake zip unzip software-properties-common fontconfig openjdk-8-jdk \
            && curl -sL https://deb.nodesource.com/setup_13.x | bash - \
            && apt-get install -y nodejs git mono-runtime make neofetch \  
            && adduser --home /home/container --disabled-password --gecos "" container \
            && echo "container:container" | chpasswd \
            && usermod -a -G sudo container



USER container
ENV  USER container
ENV  HOME /home/container/
WORKDIR /home/container/

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
