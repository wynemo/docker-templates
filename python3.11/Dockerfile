#docker build . -t python3.11-fastapi --build-arg LOCATION=global
FROM python:3.11.1-slim-bullseye
ARG LOCATION
WORKDIR /app
RUN apt-get update
RUN apt-get install -y libstdc++6 build-essential
RUN python -m venv venv
#RUN /app/venv/bin/python -m pip install pytype
COPY ./requirements.txt requirements.txt
COPY ./pip.conf /etc/pip.conf
RUN if [ "$LOCATION" = "global" ] ; then sed -i '/index/d' /etc/pip.conf ; fi
RUN /app/venv/bin/python -m pip install -r requirements.txt
