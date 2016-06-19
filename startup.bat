rem Set environment
set GOROOT=D:\home\site\wwwroot\go
set GOPATH=D:\home\site
set PATH=%PATH%;%GOPATH%\bin;%GOROOT%\bin
set GO15VENDOREXPERIMENT=1

rem Install Go
IF NOT EXIST "%GOROOT%" (
curl -O https://storage.googleapis.com/golang/go1.6.2.windows-386.zip
unzip go1.6.2.windows-386.zip
rm go1.6.2.windows-386.zip

go get github.com/Masterminds/glide
)

rem Move to repository.
cd D:\home\site\repository

rem Update dependency packages.
glide install

rem Start up management console.
go run server.go
