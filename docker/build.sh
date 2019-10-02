set -ex

# docker hub username
USERNAME=yys8646
# image name
IMAGE=tensorflow

docker build -t $USERNAME/$IMAGE:1.12.0-gpu-py3 docker
