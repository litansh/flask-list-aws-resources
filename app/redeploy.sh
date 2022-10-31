#!/bin/bash
docker compose down
docker image rm python-aws-resources:latest
docker compose up -d