FROM ubuntu:24.10

RUN userdel -f -r ubuntu

RUN groupadd -g 1000 vscode \
	&& useradd -u 1000 -g vscode -G sudo -m -s /bin/bash vscode \
	&& mkdir -p /etc/sudoers.d \
	&& echo "vscode ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vscode

RUN apt-get update \
	&& apt-get install -y \
	curl \
	git \
	golang \
	sudo \
	vim \
	wget \
	jq \
	labwc \
	wayvnc \
	websockify \
	default-jdk \
	&& rm -rf /var/lib/apt/lists/*

USER vscode

ENV WLR_BACKENDS=headless WLR_LIBINPUT_NO_DEVICES=1 WLR_RENDERER=pixman XDG_RUNTIME_DIR=/tmp/xdg DISPLAY=:0

RUN mkdir -m 0700 -p ${XDG_RUNTIME_DIR}

RUN mkdir /tmp/novnc

COPY download_novnc.sh /tmp/novnc/download.sh

RUN /tmp/novnc/download.sh \
	&& rm /tmp/novnc/download.sh

COPY novnc_wrapper.html /tmp/novnc/noVNC/index.html

EXPOSE 6080

