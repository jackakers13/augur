#SPDX-License-Identifier: MIT
FROM python:3.8.9-slim-buster as build-stage

COPY ./util/docker/backend/install_packages.sh .
RUN ./install_packages.sh

LABEL maintainer="outdoors@acm.org"
LABEL version="0.2.0"

WORKDIR /augur

COPY ./README.md .
COPY ./augur/ augur/
COPY ./metadata.py .
COPY ./setup.py .
COPY ./scripts/ scripts/
COPY ./workers/ workers/

RUN pip install .
RUN ./scripts/install/workers.sh 

COPY ./util/docker/backend/backend.docker.config.json .
RUN augur config init --rc-config-file backend.docker.config.json; mkdir repos/;

CMD augur db update-api-key docker_key; augur backend start
