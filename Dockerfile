FROM node:9

# WineHQ repo
RUN curl -sS https://dl.winehq.org/wine-builds/Release.key | apt-key add -
RUN echo "deb https://dl.winehq.org/wine-builds/debian/ jessie main" | tee /etc/apt/sources.list.d/winehq.list

# Mono repo
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian jessie main" | tee /etc/apt/sources.list.d/mono-official.list

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install --no-install-recommends -y mono-devel ca-certificates-mono

RUN apt-get install -y --install-recommends winehq-stable

RUN apt-get clean && rm -rf /var/lib/apt/lists/*