#!/bin/sh
name=$(basename $(pwd))
did=$(docker run -d -p 8080:8080 --net=host -v /opt/midpoint:/opt/midpoint:rw -P jmatis/${name})
echo $did
docker logs -f ${did}
