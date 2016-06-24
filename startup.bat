rem Set environment
set GOROOT=D:\home\site\wwwroot\go
set GOPATH=D:\home\site\gopath
set PATH=%PATH%;%GOPATH%\bin;%GOROOT%\bin
set GO15VENDOREXPERIMENT=1

rem Install Go
IF NOT EXIST "%GOROOT%" (
curl -O https://storage.googleapis.com/golang/go1.6.2.windows-386.zip
unzip go1.6.2.windows-386.zip
rm go1.6.2.windows-386.zip
)

rem Install Glide
IF NOT EXIST "%GOPATH%" (
mkdir %GOPATH%\bin
cd %GOPATH%\bin
curl -O https://github.com/Masterminds/glide/releases/download/0.10.2/glide-0.10.2-windows-386.zip
unzip glide-0.10.2-windows-386.zip
rm glide-0.10.2-windows-386.zip
)

rem Move to repository.
copy D:\home\site\repository %GOPATH%
rename %GOPATH%\repository %GOPATH%\gin-template-for-azure
cd D:\home\site\repository

rem Update dependency packages.
glide install

rem Start up management console.
go run server.go
