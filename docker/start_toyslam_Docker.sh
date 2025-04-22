#!/bin/bash

xhost +local:root  # 允许 GUI 显示

docker run -it \
  --gpus all \
  --name docker_toyslam \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -e DISPLAY=$DISPLAY \
  -e GDK_SCALE \
  -e GDK_DPI_SCALE \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $(realpath ../../../ToySLAM:/root/toyslam_ws \
  docker_toyslam /bin/bash
