#!/bin/sh
docker run -i -p 8080:8080 -p 2022:2022 --net=host -t jmatis/midpoint /bin/bash
