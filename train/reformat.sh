#!/bin/bash

LANG=pt

if [ ! -d $LANG ]; then mkdir -p $LANG; fi

cat ../7.5-fl/devel.conll | awk 'NF==0 {print} NF>0 {print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7 " " $8 " _ _ _ _ _ _" }' > $LANG/$LANG.devel

cat ../7.5-fl/train.conll | awk 'NF==0 {print} NF>0 {print $1 " " $2 " " $3 " " $4 " " $5 " " $6 " " $7 " " $8 " _ _ _ _ _ _" }' > $LANG/$LANG.train
