#!/usr/bin/env bash
cd /home/ubuntu/api

### For JDK
source "/home/ubuntu/.sdkman/bin/sdkman-init.sh"

# echo "Incrementing build version"
# ==============================
mayor=`cut -d '.' -f1 version`
minor=`cut -d '.' -f2 version`
build=`cut -d '.' -f3 version`
VERSION="$mayor.$minor.$build"

echo "Initializing application boot ..."

#java -jar spring-boot-demo-0.0.1.jar &

echo "Finalizing application boot ..."

#exit 0
