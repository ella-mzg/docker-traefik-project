FROM debian:bullseye AS builder
RUN apt-get update && apt-get install -y \
	apache2 \
	php \
	php-pgsql \
	curl && \
	apt-get clean
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY public /var/www/html
COPY scripts/start-apache.sh /usr/local/bin/start-apache.sh
RUN chmod +x /usr/local/bin/start-apache.sh

FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y \
        apache2 \
        php \
        php-pgsql \
	curl && \
        apt-get clean && rm -rf /var/lib/apt/lists/*
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY --from=builder /var/www/html /var/www/html
COPY --from=builder /usr/local/bin/start-apache.sh /usr/local/bin/start-apache.sh
RUN chmod +x /usr/local/bin/start-apache.sh

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
        CMD curl -f http://localhost || exit 1

CMD ["/usr/local/bin/start-apache.sh"]
