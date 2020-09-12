FROM httpd:2.4.43-alpine
LABEL maintainer="David Diaz diazdavid.info@gmail.com"

RUN apk update && apk add curl && apk add vim && apk add jq

COPY docker-entrypoint.sh /bin/.
RUN chmod u+x /bin/docker-entrypoint.sh

CMD ["/bin/docker-entrypoint.sh"]
