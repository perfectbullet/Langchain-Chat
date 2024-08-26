####
# 1.  enter the project directory and build the wav2lip image:
# docker build -t cuda:11.8.0-devel-ubuntu20.04-py311 .

# syntax=docker/dockerfile:1
FROM nvidia/cuda:11.8.0-devel-ubuntu20.04

# region=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

# apt use tsinghua source
RUN sed -i "s@http://.*archive.ubuntu.com@https://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list

# install python 3.11 and other deps
RUN apt update  \
    && apt install software-properties-common -y  \
    && add-apt-repository ppa:deadsnakes/ppa -y  \
    && apt update  \
    && apt install python3.9 -y  \
    && apt install python3-pip -y \
    && apt install ffmpeg -y  \
    && apt clean  \
    && rm -rf /var/lib/apt/lists/*

# restore packages
WORKDIR /app

## pip use tsinghua source
RUN python3 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip  \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install jupyterlab \
    && rm -r /root/.cache/pip
