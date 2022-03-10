# syntax=docker/dockerfile:1
 FROM v2fly/v2fly-core
 COPY config.json /etc/v2ray/config.json
 RUN set -ex \
 	 	 && apk add --no-cache caddy \
		 && mkdir -p /usr/share/caddy /etc/caddy
 COPY Caddyfile /etc/caddy/Caddyfile
 COPY service.sh /service.sh
 COPY html/* /usr/share/caddy/
 RUN chmod u+x /service.sh
 CMD /service.sh
