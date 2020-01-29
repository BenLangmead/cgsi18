#!/bin/sh

docker run --name tidy --rm \
    -v `pwd`:/git \
    -p 8787:8787 -d $* benlangmead/cgsi-2018

./wait-for-it.sh localhost:8787 -- open http://localhost:8787
