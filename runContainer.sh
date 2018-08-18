#!/bin/sh

docker run -p 8080:80 -v ~/Projects/anafora-docker/data:/anafora/data -dit anafora-container

