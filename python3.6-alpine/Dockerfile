FROM python:3.6-alpine3.8

COPY ./requirements/prod.txt /requirements/
COPY ./pip_cache/* /pip_cache/

WORKDIR /sonarx
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache --virtual .build-deps g++  \
 && apk add --no-cache libstdc++ linux-headers openssl-dev libffi-dev \
 && pip wheel --wheel-dir=/pip_cache -i https://mirrors.aliyun.com/pypi/simple/ --find-links=/pip_cache -r /requirements/prod.txt \
 && pip install --no-index --find-links=/pip_cache -r /requirements/prod.txt \
 && apk del .build-deps

RUN apk add --no-cache tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo Asia/Shanghai > /etc/timezone

# Create a group and user
RUN addgroup -g 1001 -S user && adduser -u 1001 -G user -S user
RUN chown -R user:user /sonarx

# Tell docker that all future commands should run as the appuser user
USER user
