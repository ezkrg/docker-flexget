FROM alpine:3.12

ENV WEBPASSWORD=flexget

ADD entrypoint.sh /entrypoint.sh

RUN addgroup -S flexget \
 && adduser -S -G flexget -s /usr/sbin/nologin -h /var/lib/flexget flexget \ 
 && apk add --no-cache --update \
	python3 \
	py3-pip \
 && pip install certifi \
 && pip install transmissionrpc \
 && pip install --ignore-installed flexget

EXPOSE 5050

USER flexget

ENTRYPOINT [ "sh", "/entrypoint.sh" ]

CMD [ "/usr/bin/flexget", "daemon", "start" ]
