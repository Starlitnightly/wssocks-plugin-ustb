PACKAGE=github.com/genshen/wssocks-plugin-ustb/wssocks-ustb

.PHONY: clean all

FLAGS=-gcflags="all=-trimpath=${GOPATH}" -asmflags "all=-trimpath=${GOPATH}"

# wssocks-ustb:
#	go build -o wssocks-ustb

all: wssocks-ustb-linux-amd64 wssocks-ustb-linux-arm64 wssocks-ustb-darwin-amd64 wssocks-ustb-windows-amd64.exe

wssocks-ustb-linux-amd64:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build ${FLAGS} -o wssocks-ustb-linux-amd64  ${PACKAGE}

wssocks-ustb-linux-arm64:
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build ${FLAGS} -o wssocks-ustb-linux-arm64 ${PACKAGE}

wssocks-ustb-darwin-amd64:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build ${FLAGS} -o wssocks-ustb-darwin-amd64  ${PACKAGE}

wssocks-ustb-windows-amd64.exe:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build ${FLAGS} -o wssocks-ustb-windows-amd64.exe  ${PACKAGE}


clean:
	rm -f wssocks-ustb-linux-amd64 wssocks-ustb-linux-arm64 wssocks-ustb-darwin-amd64 wssocks-ustb-windows-amd64.exe
