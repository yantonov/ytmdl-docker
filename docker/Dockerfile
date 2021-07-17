FROM python:3.8-slim-buster

MAINTAINER Yury Antonov <yantonov@yandex.ru>

ENV \
    MUSIC_HOME=/root/Music/ytmdl

RUN \
    mkdir -p $MUSIC_HOME \
    mkdir -p /root/.config/ytmdl

ADD files/config /root/.config/ytmdl/

RUN apt-get update && \
    apt-get install -y git ffmpeg

# temporary disable mainstream branch
# ADD files/requirements.txt /
# RUN pip install -r /requirements.txt

# install from fork
RUN cd /opt && git clone https://github.com/yantonov/ytmdl.git && cd ytmdl && git checkout ignore_chapters && pip install .

WORKDIR $MUSIC_HOME
