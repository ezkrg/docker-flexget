FROM alpine:3.10

ENV WEBPASSWORD=flexget

ADD entrypoint.sh /entrypoint.sh

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

ENTRYPOINT [ "sh", "/entrypoint.sh" ]

CMD [ "/usr/bin/flexget", "daemon", "start" ]