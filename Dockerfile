FROM golang:alpine as build

RUN apk update \
	&& mkdir -p $GOPATH/src/simpleweb

COPY ./src/main.go $GOPATH/src/simpleweb
COPY ./bin/upx /bin/upx

RUN GOOS=linux GOARCH=386 go build -v -o /bin/simpleweb simpleweb \
	&& cp /bin/simpleweb /bin/simpleweb-big \
	&& /bin/upx --best /bin/simpleweb


FROM scratch
COPY --from=build /bin/simpleweb /simpleweb
COPY --from=build /bin/simpleweb-big /bin/simpleweb-big

EXPOSE 8088
ENTRYPOINT ["/simpleweb"]
