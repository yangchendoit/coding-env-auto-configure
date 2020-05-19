FROM alpine:edge
COPY . /work
WORKDIR /work
RUN apk add make bash openssh ruby curl
