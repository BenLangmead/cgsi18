#!/bin/bash

set -ex

URL=http://snaptron.cs.jhu.edu/data
DATASETS="ct_h_s ct_m_s supermouse encode1159 srav1 srav2"

for j in ${DATASETS} ; do
    if [ ! -d $j ] ; then
        mkdir -p ${j}
        FNS="junctions.header.tsv samples.tsv junctions.bgz"
        if [ ${j} != "srav1" ] ; then
            FNS="genes.header.tsv genes.bgz ${FNS}"
        fi
        for i in ${FNS} ; do
            echo "Downloading ${URL}/${j}/${i}..."
            wget -q -O ${j}/${i} ${URL}/${j}/${i}
        done
    fi
done
