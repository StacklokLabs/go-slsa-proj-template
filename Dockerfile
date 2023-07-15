FROM golang:1.20-alpine
ENV APP_ROOT=/opt/app-root
ENV GOPATH=$APP_ROOT

WORKDIR $APP_ROOT/src/
ADD go.mod go.sum $APP_ROOT/src/
RUN go mod download

# Add source code
ADD ./ $APP_ROOT/src/

RUN CGO_ENABLED=0 go build -trimpath -o go-app ./cmd

EXPOSE 8080

ENTRYPOINT ["./go-app"]