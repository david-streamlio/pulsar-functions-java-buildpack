FROM ubuntu:20.04

ARG pulsar_uid=10000
ARG pulsar_gid=10001
ARG stack_id="io.functionmesh.stack"

RUN apt-get update && \
apt-get install -y xz-utils ca-certificates git wget jq gcc && \
rm -rf /var/lib/apt/lists/* && \
wget https://github.com/sclevine/yj/releases/download/v5.1.0/yj-linux-amd64 -O /usr/local/bin/yj  && \
chmod +x /usr/local/bin/yj

LABEL io.buildpacks.stack.id=${stack_id}

RUN groupadd pulsar --gid ${pulsar_gid} && \
useradd --uid ${pulsar_uid} --gid ${pulsar_gid} -m -s /bin/bash pulsar

ENV CNB_USER_ID=${pulsar_uid}
ENV CNB_GROUP_ID=${pulsar_gid}
ENV CNB_STACK_ID=${stack_id}

USER ${CNB_USER_ID}:${CNB_GROUP_ID}