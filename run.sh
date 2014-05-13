#!/bin/sh
docker_id=$(docker run -d -p 8080:8080 --net=host -v /opt/midpoint:/opt/midpoint:rw -P jmatis/midpoint)
echo $docker_id
docker logs -f ${docker_id}
