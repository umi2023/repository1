#!/bin/bash
[ -z "$1" ] && echo "Please enter your DockerHub username, example: sh build_all_and_publish_dockerhub.sh username" && exit 1
echo "dockerhub\`s username: $1"

cd shopfront
mvn clean install
if docker build -t $1/iashopfront . ; then
  docker push ikbelaloui/iashopfront
fi
cd ..

cd productcatalogue
mvn clean install
if docker build -t $1/iaproductcatalogue . ; then
  docker push ikbelaloui/iaproductcatalogue
fi
cd ..

cd stockmanager
mvn clean install
if docker build -t $1/iastockmanager . ; then
  docker push ikbelaloui/iastockmanager
fi
cd ..
