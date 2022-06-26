FROM golang:1.18-bullseye AS build

ARG VERSION

WORKDIR /go/src/sandbox
COPY . /go/src/sandbox

RUN CGO_ENABLED=0 go build -ldflags "-s -w -X main.version=${VERSION}" -o /go/bin/sandbox

FROM debian:bullseye-slim

COPY --from=build /go/bin/sandbox /

CMD ["/sandbox"]
