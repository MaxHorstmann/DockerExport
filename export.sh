#!/bin/bash
docker build -t myapp .
id=$(docker create myapp)
docker cp $id:/buildOutput - | tar zxf -
docker rm -v $id