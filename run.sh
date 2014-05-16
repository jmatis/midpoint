#!/bin/sh
docker_id=$(docker run -d -p 8080:8080 -p 2022:2022 --net=host -v /opt/midpoint:/opt/midpoint:rw -P jmatis/midpoint)
echo $docker_id
docker logs -f ${docker_id}
