FROM debian:buster-slim

RUN apt-get update -qq && apt-get upgrade -y

#g++-multilib-for-luajit, xxd-for-ttyd, python-for-feeds, vim-for-quickedit rsync-for-gcc92 bc-for-mkroot

RUN apt-get install -y --no-install-recommends build-essential libncurses5-dev gawk \
 git subversion libssl-dev gettext zlib1g-dev swig unzip time ca-certificates wget \
 file python g++-multilib xxd python3 python3-distutils vim rsync bc

RUN rm -rf /var/lib/apt/lists/* && apt-get clean

# mkdir empty && docker build -f debian-buster.Dockerfile -t kompile-openwrt-buster empty/ && rmdir empty

#note: optional changable labels to be after cacheable stuff above
LABEL maintainer="Sureshkumar <suresh241098@gmail.com>"
LABEL date="13 MAY 2020"

RUN groupadd -g 1000 kompile && useradd -g 1000 -u 1000 kompile
USER kompile
#WORKDIR /home/kompile/openwrt/src
WORKDIR /home/kompile

CMD /bin/bash
