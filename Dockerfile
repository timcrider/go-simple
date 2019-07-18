# Start with an official golang alpine image
FROM golang:alpine as build

# Update packages and create the directory for our source
RUN apk update \
	&& mkdir -p $GOPATH/src/simpleweb

# Copy in the source and the upx binary compression tool
COPY ./src/* $GOPATH/src/simpleweb/
COPY ./bin/upx /bin/upx

# Compile the go app
# Create a copy of the original for size comparison
# Run upx against the binary to compress
RUN GOOS=linux CGO_ENABLED=0 go build -v -o /bin/simpleweb simpleweb \
	&& cp /bin/simpleweb /bin/simpleweb-big \
	&& /bin/upx --best /bin/simpleweb

# Display the difference in binary size (for comparison)
# Local builds: down to 3.0M from 6.2M
RUN ls -alh /bin/simple*

# Reset back to a scratch image and copy in the 2 binaries from the original image
# Local image size is 9.63M with 9.2M being the application itself and roughly 430k for the container OS
FROM scratch
COPY --from=build /bin/simpleweb /bin/simpleweb

#COPY --from=build /bin/simpleweb-big /bin/simpleweb-big

# Expose the web server port
EXPOSE 8088

# Make the binary the entrypoint for the container
ENTRYPOINT ["/bin/simpleweb"]
