go mod init

or

go mod init github.com/you/hello use Git tags

go get github.com/go-chi/chi@v4.0.1

or Git branch name

go get github.com/go-chi/chi@master

or Git commit hash

go get github.com/go-chi/chi@08c92af

Поскольку мы еще не импортировали пакет в любом месте нашего проекта, он был помечен как // indirect.

Мы можем привести это в порядок с помощью следующей команды:

go mod tidy

Updating Package Versions

You may use

go get -u

or

go get -u=patch

to update dependencies to the latest minor or patch upgrades respectively.

go mod edit -replace github.com/go-chi/chi=./packages/chi Result:
module github.com/you/hello

go 1.12

require github.com/go-chi/chi v4.0.2+incompatible replace github.com/go-chi/chi => ./packages/chi