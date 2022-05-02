# syntax=docker/dockerfile:1
FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update
RUN apt-get install python3-dev default-libmysqlclient-dev gcc  -y

# RUN apk update
# RUN apk add musl-dev mariadb-dev gcc
# RUN pip install mysqlclient


RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app/
RUN pip3 install -r requirements.txt
COPY . /app/