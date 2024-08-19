#!/usr/bin/env bash

rm -rf docker-compose.yml

docker buildx build . --output type=docker,name=elestio4test/peppermint:latest | docker load