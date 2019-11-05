set -ex

# docker hub username
USERNAME=yys8646
# image name
IMAGE=tensorflow
version=`cat VERSION`

docker build -t $USERNAME/$IMAGE:$version docker
