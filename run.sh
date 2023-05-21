
UBUNTU_VERSION=22.04
CUDA_VERSION=11.8.0
IMAGE_TAG=billybag2/meshroom:${CUDA_VERSION}_Ubuntu_${UBUNTU_VERSION}

docker run -it --rm -e DISPLAY=192.168.0.10:0 -p 2222:22 --gpus all ${IMAGE_TAG} /bin/bash


