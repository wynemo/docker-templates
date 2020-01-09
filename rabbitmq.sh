#!/bin/bash

set -e

chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/
/usr/local/bin/docker-entrypoint.sh rabbitmq-server
