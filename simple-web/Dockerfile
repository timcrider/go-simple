# Start with an official golang alpine image
FROM golang:alpine as build

# Update packages and create the directory for our source
RUN apk update \
	&& mkdir -p /src/simpleweb

# Copy in the source and the upx binary compression tool
COPY ./main.go /src/simpleweb/
COPY ./go.mod /src/simpleweb/go.mod

RUN go version ; pwd ; ls -alh

# Compile the go app
RUN cd /src/simpleweb/ && GOOS=linux CGO_ENABLED=0 go build -v -o /bin/simpleweb

RUN ls -alh /bin/simple*

# Reset back to a scratch image and copy in the 2 binaries from the original image
# Local image size is 9.63M with 9.2M being the application itself and roughly 430k for the container OS
FROM scratch
COPY --from=build /bin/simpleweb /bin/simpleweb

# Expose the web server port
EXPOSE 8088

# Make the binary the entrypoint for the container
ENTRYPOINT ["/bin/simpleweb"]
