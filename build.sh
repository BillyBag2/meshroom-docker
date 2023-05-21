cd docker
UBUNTU_VERSION=22.04
CUDA_VERSION=11.8.0

docker build \
    --build-arg UBUNTU_VERSION=${UBUNTU_VERSION} \
    --build-arg CUDA_VERSION=${CUDA_VERSION} \
    -t billybag2/meshroom:${CUDA_VERSION}_Ubuntu_${UBUNTU_VERSION} .

