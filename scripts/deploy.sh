#! /usr/bin/env bash
set -x
set -e

export RANCHER_URL=http://10.29.5.195:8080/v2-beta/projects/1a5
export RANCHER_ACCESS_KEY=DF47E8296251A155865C
export RANCHER_SECRET_KEY=VToZFrvh43H6F4nsG3oGUYeSABiwH1kD7MB5v2af

if [[ -z $DOCKER_REGISRTY ]]; then
  DOCKER_REGISRTY=10.202.129.3:5000
fi
IMAGE_NAME=${DOCKER_REGISRTY}/tw-ms-train/user-service:${GO_PIPELINE_COUNTER}

sed -i "s#<IMAGE_NAME>#$IMAGE_NAME#g" docker-compose.yml

rancher-compose -p mst-user-service up -d -c --upgrade
