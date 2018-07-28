#!/bin/sh

set -ex

for j in ct_h_s ct_m_s supermouse encode1159 srav1 srav2 ; do
    if [ ! -d $j ] ; then
        mkdir -p $j
        for i in junctions.bgz samples.tsv ; do
            wget -O $j/$i http://snaptron.cs.jhu.edu/data/$j/$i
        done
        if [ $j != "srav1" ] ; then
            wget -O $j/$i http://snaptron.cs.jhu.edu/data/$j/genes.bgz
            wget -O $j/$i http://snaptron.cs.jhu.edu/data/$j/genes.bgz.tbi
        fi
    fi
done
