from lpenz/debian-bullseye-mips64el as builder

WORKDIR /

run apt-get update
run apt-get install -y wget build-essential libreadline-dev libssl-dev libsqlite3-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
run wget https://www.python.org/ftp/python/3.8.11/Python-3.8.11.tgz
run tar zxvf Python-3.8.11.tgz
run cd Python-3.8.11 && ./configure --enable-optimizations
run cd Python-3.8.11 && make
run cd Python-3.8.11 && make alt install
run python3.8 -m venv venv
