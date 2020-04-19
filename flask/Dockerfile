FROM wynemo/python38:latest
WORKDIR /app
ENV PATH=/venv/bin:$PATH
COPY ./requirements.txt /app/
RUN pip install -i https://mirrors.aliyun.com/pypi/simple/ -r requirements.txt
CMD ["python", "manage.py", "runserver"]
