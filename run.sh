#!/bin/bash
# bash run.sh -n project_name -s /home/mlg/yys -t /home/yys -c /bin/bash

while getopts rn: option
do
case ${option}
in
r) REMOVE='--rm' ;;
n) NAME='--name='${OPTARG} ;;
esac
done

docker run ${REMOVE} \
           -it \
           --net host \
           ${NAME:-"--name=tensorflow1.8"} \
           -e DISPLAY \
           -v=$HOME/.Xauthority:/root/.Xauthority:rw \
           -v=/tmp/.X11-unix:/tmp/.X11-unix:rw \
           --mount type=bind,source=${SOURCE:-$HOME/yys},target=${TARGET:-/yys} \
           --mount type=bind,source=/mnt/sdb1/data,target=/data \
           --gpus all \
           tensorflow/tensorflow:1.8.0-gpu-py3 \
           /bin/bash
