FROM alpine:3.7

RUN apk update && \
    apk add krb5-server

COPY configure.sh /var/lib/krb5kdc/

ENTRYPOINT [ "sh", "/var/lib/krb5kdc/configure.sh"]
