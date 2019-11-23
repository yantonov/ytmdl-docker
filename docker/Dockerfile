FROM python:3.8-slim-buster

MAINTAINER Yury Antonov <yantonov@yandex.ru>

ENV \
    MUSIC_HOME=/root/Music/ytmdl

RUN \
    mkdir -p $MUSIC_HOME

ADD files/requirements.txt /
RUN pip install -r /requirements.txt

RUN apt-get update && \
    apt-get install -y ffmpeg

WORKDIR $MUSIC_HOME
