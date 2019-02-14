#!/bin/sh 

## clone h2spec
git clone https://github.com/summerwind/h2spec ./src/github.com/summerwind/h2spec
cd $GOPATH/src/github.com/summerwind/h2spec 

# If we need a particular commit hash...
# git checkout 5de785c2f63d39695b8d933e0fde4698eb422fba
git checkout d7efa68f9617edaf0ddea15bb8814d515b6531b9


## install dependencies
#go get github.com/Masterminds/glide
#glide install

## New build step...
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
make build

mkdir /release 

GOARCH=amd64 GOOS=linux go build cmd/h2spec/h2spec.go
mv ./h2spec /release/h2spec_linux

GOARCH=amd64 GOOS=darwin go build cmd/h2spec/h2spec.go
mv ./h2spec /release/h2spec_darwin

GOARCH=amd64 GOOS=windows go build  cmd/h2spec/h2spec.go
mv ./h2spec.exe /release/h2spec_win.exe

ls -al /release
echo "DONE."
