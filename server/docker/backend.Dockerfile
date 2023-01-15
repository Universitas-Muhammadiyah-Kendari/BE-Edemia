############################
# STEP 1 build executable binary
# pull official base image
############################
FROM golang:1.18-alpine as builder
RUN find / -perm +6000 -type f -exec chmod a-s {} \; || true


# Install dependencies
RUN apk add --no-cache git


# Specify workdir to avoid error $GOPATH/go.mod exists but should not
WORKDIR /app

# Fetch dependencies.
# Using go mod with go > 1.11
# will also be cached if we won't change mod/sum
ENV GO111MODULE=on
COPY go.mod go.sum ./
RUN go mod download
RUN go mod verify

# Copy the source code
# Build the binary
COPY . .
RUN CGO_ENABLED=0 \
  GOOS=linux GOARCH=amd64 \
  go build -ldflags="-w -s" \
  -o Edemia \
  ./app/main.go

############################
# STEP 2 build a small image
############################

# Dynatrace can't do deep scanning in alpine
FROM alpine:3.17
RUN find / -perm +6000 -type f -exec chmod a-s {} \; || true
RUN apk add ca-certificates
RUN apk update && apk add bash && apk --no-cache add tzdata

# Create appuser
WORKDIR /app
ENV USER=appuser
ENV UID=10001
ENV TZ=Asia/Jakarta

# See https://stackoverflow.com/a/55757473/12429735RUN 
RUN adduser \    
  --disabled-password \    
  --gecos "" \    
  --home "/nonexistent" \    
  --shell "/sbin/nologin" \    
  --no-create-home \    
  --uid "${UID}" \    
  "${USER}"

# Copy our static executable
COPY --from=builder --chown=appuser:appuser /app/Edemia .
COPY --from=builder --chown=appuser:appuser /app/config/.env.example ./config/app.env

# Healthcheck

HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 CMD curl --fail http://localhost:3000/health

# Tell docker how the process PID 1 handle gracefully shutdown
# Signal Interupt for gracefully shutdown echo server
STOPSIGNAL SIGINT

# Tell if our container will open this port
# Set app to use this port too
EXPOSE 3000

# There are 2 different method how docker run our program
# Shell form: `CMD command param1 param2` equivalent with 
#             `/bin/sh -c command param1 param2`
# Exec form: `CMD ["command", "param1", "param2"]`
#
# Since shell form running our program inside sh, so the PID 1
# is sh, not our program. Hence, our program never receive stop signal
# So we will use exec form.

# Entrypoint is how docker will execute our program by default
# CMD is the default param and can be replaced by docker params, even though
# we can use it to execute our program.

ENTRYPOINT ["./Edemia"]