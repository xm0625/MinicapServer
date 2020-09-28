#!/bin/sh

nohup sleep 10s && /bin/sh ./run.sh >/dev/null 2>&1 &

adb -a -P 5037 server nodaemon