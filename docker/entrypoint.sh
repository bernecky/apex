#!/bin/env bash

export DYALOG_RELEASE=$(ls /opt/mdyalog)
export DYALOG=/opt/mdyalog/$DYALOG_RELEASE/64/unicode
export SESSION_FILE=$DYALOG/default.dse
echo $TO

cat /app/docker/run.dyalog - | $DYALOG/dyalog -s -b $@
