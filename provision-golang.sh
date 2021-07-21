#!/bin/bash
set -eux

curl -sLO https://golang.org/dl/go1.16.6.linux-amd64.tar.gz && \
   tar xzvf go1.16.6.linux-amd64.tar.gz

export GOROOT=/home/vagrant/go
export GOPATH=/home/vagrant/.go
export PATH=$PATH:$GOROOT/bin

rm -fr nv2 || true
git clone https://github.com/notaryproject/nv2
cd nv2 && \
	go build -o ~/.docker/cli-plugins/docker-generate ./cmd/docker-generate && \
	go build -o ~/.docker/cli-plugins/docker-nv2 ./cmd/docker-nv2