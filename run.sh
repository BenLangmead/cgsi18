#!/bin/sh

docker run --name tidy --rm \
    -e PASSWORD=snaptron-data \
    -p 8787:8787 -d $* rocker/tidyverse:3.5.1

./wait-for-it.sh localhost:8787 -- open http://localhost:8787
