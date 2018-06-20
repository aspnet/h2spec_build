#!/bin/sh 

## clone h2spec
git clone https://github.com/summerwind/h2spec ./src/github.com/summerwind/h2spec
cd $GOPATH/src/github.com/summerwind/h2spec 

## (currently) latest commit!
git checkout 5de785c2f63d39695b8d933e0fde4698eb422fba

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
