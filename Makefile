GOCMD=go
GOFMTCMD=gofmt
GOLANGCICMD=golangci-lint
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
GOVET=$(GOCMD) vet
GOLANGCIRUN=$(GOLANGCICMD) run
BINARY_NAME=./target/debug/gomposer

all: run
debug:
	$(GOBUILD) -o ./target/debug/gomposer -v
release:
	$(GOBUILD) -o ./target/release/gomposer -ldflags="-s -w" -v
pack: release
	upx --brute ./target/release/gomposer
test:
	$(GOTEST) -v ./...
clean:
	$(GOCLEAN)
	rm -rf ./target
run: debug
	./$(BINARY_NAME)
cs:
	$(GOFMTCMD) -w -s .
check:
	$(GOLANGCIRUN)
