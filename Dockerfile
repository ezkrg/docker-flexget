FROM alpine:3.6

RUN addgroup -S flexget \
 && adduser -S -G flexget -s /usr/sbin/nologin -h /var/lib/flexget flexget \ 
 && apk add --no-cache --update \
	python \
	py-pip \
 && pip install certifi \
 && pip install transmissionrpc \
 && pip install flexget

EXPOSE 5050

USER flexget

ENTRYPOINT [ "/usr/bin/flexget", "daemon", "start" ]