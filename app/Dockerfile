# syntax=docker/dockerfile:1

FROM python:3.9.5
MAINTAINER Litan Shamir <litansh@gmail.com>

WORKDIR /python-aws-resources

COPY . .

RUN pip3 install -r requirements.txt

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
