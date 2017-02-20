#!/usr/bin/env bash
cd /home/home/api

# echo "Incrementing build version"
# ==============================
mayor=`cut -d '.' -f1 version`
minor=`cut -d '.' -f2 version`
build=`cut -d '.' -f3 version`
VERSION="$mayor.$minor.$build"

echo "Initializing application..."

java -jar spring-boot-demo-0.0.1.jar