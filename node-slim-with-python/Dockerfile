# podman build -f Dockerfile . -t yq
FROM node:slim as builder
WORKDIR /yq-admin-front
COPY ./yq-admin-front /yq-admin-front
RUN apt-get update
RUN apt-get install -y python3
