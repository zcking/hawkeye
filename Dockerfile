FROM python:3.7-alpine
ENV PYTHONUNBUFFERED 1
COPY requirements.txt /tmp/requirements.txt
RUN pip install -U pip \
    && pip install -r /tmp/requirements.txt
WORKDIR /code
COPY . /code