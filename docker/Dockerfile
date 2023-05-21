ARG UBUNTU_VERSION=22.04
ARG CUDA_VERSION=11.8.0
FROM nvidia/cuda:${CUDA_VERSION}-devel-ubuntu${UBUNTU_VERSION}

ARG MESHROOM_TAR=Meshroom-2023.1.0-linux.tar.gz

RUN ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
    && apt-get install -y \
        wget \
        nano \
        libglib2.0-0 \
        openssh-server \
        libgl1-mesa-glx \
        libx11-xcb1 libxcb-icccm4 libxcb-image0 libxcb1 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-render0 libxcb-shape0 libxcb-shm0 libxcb-sync1 libxcb-util1 libxcb-xfixes0 libxcb-xinerama0 libxcb-xkb1 \
        qtcreator qtbase5-dev qt5-qmake cmake


COPY ${MESHROOM_TAR} /root
RUN cd /root && tar -xzf ${MESHROOM_TAR}
RUN rm /root/${MESHROOM_TAR}
RUN mkdir /var/run/sshd

# Set root password
RUN echo 'root:root' | chpasswd

# Allow root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#X11UseLocalhost yes/X11UseLocalhost no/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22

#CMD ["/usr/sbin/sshd", "-D"]
