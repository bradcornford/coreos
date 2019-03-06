#!/usr/bin/env bash

mkdir -p /media/temp/processing
mkdir -p /media/temp/blackhole
mkdir -p /media/temp/downloads
mkdir -p /media/storage/archive

for fld in ${MEDIA_FOLDERS}
do
    mkdir -p /media/temp/blackhole/$fld
    mkdir -p /media/temp/downloads/$fld
    mkdir -p /media/storage/$fld
done

chown -R brad:brad /media/temp
chown -R brad:brad /media/storage