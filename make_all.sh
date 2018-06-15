#!/bin/sh 

## clone h2spec
git clone https://github.com/summerwind/h2spec ./src/github.com/summerwind/h2spec
cd $GOPATH/src/github.com/summerwind/h2spec 

## (currently) latest commit!
git checkout d99d17171179c709cf23a3df1aadc9657addf825

## install dependencies
go get github.com/Masterminds/glide
glide install

mkdir /release 

GOARCH=amd64 GOOS=linux go build cmd/h2spec/h2spec.go
mv ./h2spec /release/h2spec_linux

GOARCH=amd64 GOOS=darwin go build cmd/h2spec/h2spec.go
mv ./h2spec /release/h2spec_darwin

GOARCH=amd64 GOOS=windows go build  cmd/h2spec/h2spec.go
mv ./h2spec.exe /release/h2spec_win.exe

ls -al /release
echo "DONE."