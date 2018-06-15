FROM  golang:1.10-stretch

WORKDIR $GOPATH

COPY make_all.sh make_all.sh

RUN chmod +x ./make_all.sh

RUN echo "ready to build"

RUN ./make_all.sh
