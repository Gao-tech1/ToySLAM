FROM osrf/ros:melodic-desktop-full

# ENV CATKIN_WS=/root/catkin_ws

RUN   apt-get update \ 
      && apt-get install -y \
      cmake \
      libatlas-base-dev \
      #libeigen3-dev \
      libgoogle-glog-dev \
      #libogre-1.9-dev\
      #libsuitesparse-dev \
      #python-catkin-tools \
      ros-melodic-novatel-msgs \
      software-properties-common \
      libgoogle-glog-dev \
      gedit\
      ros-melodic-rtcm-msgs \
      ros-melodic-nmea-navsat-driver \
      ros-melodic-gps-common \
      && add-apt-repository -y ppa:borglab/gtsam-release-4.0 \
      && apt-get update \
      && apt install -y libgtsam-dev libgtsam-unstable-dev \
      && rm -rf /var/lib/apt/lists/*
      
SHELL ["/bin/bash", "-c"]
      
RUN   mkdir -p ~/software_ws \
      && mkdir -p ~/catkin_ws/src \
      && cd ~/catkin_ws/src \
      && git clone https://github.com/Gao-tech1/ToySLAM \
      && mv ./ToySLAM/support_files/ceres-solver.tar.gz ~/software_ws/ \
      && cd ~/software_ws \
      && tar -zxvf ceres-solver.tar.gz \
      && mkdir -p ceres-bin \
      && cd ceres-bin \
      && cmake ../ceres-solver \
      && make install \ 
      && cd ~/catkin_ws \
      && source /opt/ros/melodic/setup.bash \
      && mv /usr/include/flann/ext/lz4.h /usr/include/flann/ext/lz4.h.bak \
      && mv /usr/include/flann/ext/lz4hc.h /usr/include/flann/ext/lz4.h.bak \
      && ln -s /usr/include/lz4.h /usr/include/flann/ext/lz4.h \
      && ln -s /usr/include/lz4hc.h /usr/include/flann/ext/lz4hc.h \
      && catkin_make
      
RUN echo "source /opt/ros/melodic/setup.bash" >> /root/.bashrc \
    && echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc

WORKDIR /root/catkin_ws
