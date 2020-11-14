#!/bin/bash
id=$(docker create myapp)
docker cp $id:/buildOutput - | tar zxf -
docker rm -v $id