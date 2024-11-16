FROM debian:latest
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

EXPOSE 80
CMD ["/usr/local/bin/start-apache.sh"]
