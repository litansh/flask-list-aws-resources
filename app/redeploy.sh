#!/bin/bash
cd /Users/litan/litansh-repo/flask-list-aws-resources/app
docker compose down
docker image rm python-aws-resources:latest
docker compose up -d