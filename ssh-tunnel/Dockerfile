FROM alpine:3.9

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

CMD ssh -nNT -o GatewayPorts=true -L $LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT $SSH_USER@$SSH_HOST
