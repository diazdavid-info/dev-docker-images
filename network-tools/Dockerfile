FROM alpine/curl:8.12.1

RUN apk add --update inetutils-telnet traceroute jq vim && rm -rf /var/cache/apk/*

RUN mkdir -p /opt/scripts

COPY cs.sh /opt/scripts/cs

RUN chmod +x /opt/scripts/cs

ENV PATH="/opt/scripts:${PATH}"
