FROM golang:1.16-buster AS build

ARG VERSION

WORKDIR /go/src/sandbox
COPY . /go/src/sandbox

RUN CGO_ENABLED=0 go build -ldflags "-s -w -X main.version=${VERSION}" -o /go/bin/sandbox

FROM debian:buster-slim

COPY --from=build /go/bin/sandbox /

CMD ["/sandbox"]
