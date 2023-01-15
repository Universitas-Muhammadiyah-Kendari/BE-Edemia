FROM golang:1.18-alpine
RUN find / -perm +6000 -type f -exec chmod a-s {} \; || true

RUN go install github.com/cespare/reflex@latest

ENTRYPOINT ["reflex", "-c", "reflex.conf"]