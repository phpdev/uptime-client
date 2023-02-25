FROM alpine:3.16

# Install php
RUN apk add php php-openssl

# Remove apk cache
RUN rm -rf /var/cache/apk/*

# Cron : https://stackoverflow.com/questions/37015624/how-to-run-a-cron-job-inside-a-docker-container
ADD crontab.txt /crontab.txt
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint.sh
RUN /usr/bin/crontab /crontab.txt

# Copy app
RUN mkdir -p /srv/app
COPY app/ /srv/app/

WORKDIR /srv/app/

CMD ["/docker-entrypoint.sh"]
