####
# 1.  enter the project directory and build the wav2lip image:
# docker build -t cuda:11.8.0-devel-ubuntu20.04-py311-langchain .

# syntax=docker/dockerfile:1
FROM cuda:11.8.0-devel-ubuntu20.04-py311

# restore packages
WORKDIR /root/

COPY wheel_packages wheel_packages
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt --no-index -f wheel_packages  \
    && rm -rf /roo/.cache/pip wheel_packages requirements.txt

WORKDIR /root/app

