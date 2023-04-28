FROM python:3.8-slim-buster

MAINTAINER Yury Antonov <1390348+yantonov@users.noreply.github.com>

ENV \
    MUSIC_HOME=/root/Music/ytmdl

RUN \
    mkdir -p $MUSIC_HOME \
    mkdir -p /root/.config/ytmdl

ADD files/requirements.txt /
RUN pip install -r /requirements.txt

ADD files/config /root/.config/ytmdl/

RUN apt-get update && \
    apt-get install -y ffmpeg

WORKDIR $MUSIC_HOME
