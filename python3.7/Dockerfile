FROM jjanzic/docker-python3-opencv

COPY ./requirements/watermark.txt /requirements/
COPY ./pip_cache/* /pip_cache/
COPY ./docker/.pydistutils.cfg /root/

WORKDIR /sonarx

RUN pip wheel --wheel-dir=/pip_cache -i https://mirrors.aliyun.com/pypi/simple/ --find-links=/pip_cache -r /requirements/watermark.txt
RUN pip install --no-index --find-links=/pip_cache -r /requirements/watermark.txt

# Create a group and user
RUN groupadd -g 1001 user
RUN useradd -g 1001 user
RUN chown -R user:user /sonarx

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN sed -i 's/security.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y tesseract-ocr

# Tell docker that all future commands should run as the appuser user
USER user
