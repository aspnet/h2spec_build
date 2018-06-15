#!/bin/sh

mkdir -p ./out/release
docker build -t h2spec_build:latest .
docker run -v $PWD/out:/OUT h2spec_build:latest cp -r /release /OUT
dotnet pack
