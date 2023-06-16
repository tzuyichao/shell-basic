#!/bin/bash

if [ -n "$1" ] && [ -n "$2" ]; then
  ./kafka-topics describe \
    --bootstrap-server $1 \
    --command-config client.properties \
    --topic $2 \
    --describe
else
  echo "Using: ./describe-topic.sh [bootstrap-server] [topic]"
fi
