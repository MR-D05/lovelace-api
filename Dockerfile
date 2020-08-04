FROM debian
FROM ubuntu:20.04
ENV PATH=/gnat-llvm/llvm-interface/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/gnat/bin
COPY script.qs /tmp/
COPY lovelace-api /root/
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
 sudo \
 curl \
 systemctl \
 libx11-6 \
 libx11-xcb1 \
 fontconfig \
 dbus \
 make \
 cmake \
 g++ \
 git \
 wget \
 gnupg \
 subversion \
 postgresql \
 vim-youcompleteme \
 systemctl \
 nginx \
 libpq-dev \
 && wget https://community.download.adacore.com/v1/4d99b7b2f212c8\
efdab2ba8ede474bb9fa15888d?filename=gnat-2020-20200429-x86_64-linux-bin \
    --output-document=/tmp/gnat-community-2020-20200429-x86_64-linux-bin \
 && chmod +x /tmp/gnat-community-2020-20200429-x86_64-linux-bin \
 && /tmp/gnat-community-2020-20200429-x86_64-linux-bin \
      --platform minimal --script /tmp/script.qs
COPY nginx.conf /etc/nginx/
WORKDIR /opt/
RUN git clone https://github.com/AdaCore/gnatcoll-db.git
WORKDIR /opt/gnatcoll-db/
RUN git checkout 20.2
WORKDIR /opt/gnatcoll-db/sql/
RUN make setup
RUN make
RUN bash -c "PATH=$PATH:/opt/gnat/bin make install"
WORKDIR /opt/gnatcoll-db/postgres/
RUN make setup
RUN make
RUN bash -c "PATH=$PATH:/opt/gnat/bin make install"
WORKDIR /opt/gnatcoll-db/gnatcoll_db2ada/
RUN make setup DB_BACKEND=postgres
RUN make
RUN bash -c "PATH=$PATH:/opt/gnat/bin make install"
WORKDIR /root/
