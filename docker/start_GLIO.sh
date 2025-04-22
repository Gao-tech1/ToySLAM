# #!/bin/bash

# docker container ls -a -f name=glio_ublox  | grep glio_ublox$ > /dev/null

# if [ $? == 0 ]
# then
# 	docker container start glio_ublox
# 	docker exec -it glio_ublox /bin/bash

# else
# 	xhost +
# 	docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE -v /home/gao-yixin/GLIO_LEO:/root/catkin_ws --name  docker_glio /bin/bash
# fi

#!/bin/bash

docker container ls -a -f name=docker_toyslam | grep docker_toyslam$ > /dev/null

if [ $? == 0 ]
then
	docker container start docker_toyslam
	docker exec -it docker_toyslam /bin/bash

else
	xhost +
	docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE -v /home/gao-yixin/下载/catkin_ws/ToySLAM:/root/toyslam_ws --name docker_toyslam docker_toyslam /bin/bash
fi