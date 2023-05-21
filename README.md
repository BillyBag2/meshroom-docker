# meshroom-docker

* Very much work in progress!
* At time of writing Untested!
* At time of writing no scheme to share host files with container.

# Requirements

* Docker working with an NVIDIA card. How to do this is not documented here.
* Download to the docker/ directory the prebuilt linux meshroom binaries.
   * At the time of writing this was `Meshroom-2023.1.0-linux.tar.gz` available from the releases section of https://github.com/alicevision/Meshroom/ at https://github.com/alicevision/Meshroom/releases/tag/v2023.1.0 . At the time of writing there was no automated way to do this.

# Building image

Run `build.sh`

# Running image

* Edit `run.sh` so that the DISPLAY env variable contains the actual IP address of the X11 "server".

* Run `run.sh`

* `ssh` from the X11 server to the docker host on port 2222 with user `root`, pasword `root` with X11 forwarding enabled. eg `ssh root@192.168.0.123 -p 2222" 

# Know issues

* Docker image is very insecure giving uptrotected ssh access to the docker container!
* The docker build proccess could be muti stage making a more efficent final image.
* Incomplete with no scheme to share host files with the container. Need to add `-v` options to 'run.sh'.


