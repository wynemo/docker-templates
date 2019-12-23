FROM python:3.8-alpine as builder

WORKDIR /

COPY requirements.txt /requirements.txt
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add  g++ make musl-dev libffi-dev libressl-dev
RUN python -m venv venv
RUN venv/bin/pip install -i https://mirrors.aliyun.com/pypi/simple/ -r requirements.txt

FROM python:3.8-alpine

WORKDIR /

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add libressl
RUN apk add libzmq
COPY --from=builder /venv venv
