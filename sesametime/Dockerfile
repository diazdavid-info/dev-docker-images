FROM alpine:3.13.4

ENV USER_NAME=example@example.org
ENV USER_PASS=example

RUN apk add --update curl jq && rm -rf /var/cache/apk/*

WORKDIR /root
COPY ./exec.sh .

ENTRYPOINT ["/bin/sh"]
CMD ["/root/exec.sh"]