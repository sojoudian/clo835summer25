FROM golang:1.26-alpine AS build
WORKDIR /app
COPY go.mod .
COPY main.go .
RUN CGO_ENABLED=0 go build -o server main.go

FROM scratch
COPY --from=build /app/server /server
EXPOSE 80
CMD ["/server"]
