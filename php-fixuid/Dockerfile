ARG IMAGE_NAME
ARG IMAGE_TAG
ARG IMAGE_ARCHITECTURE=amd64

FROM ${IMAGE_NAME}:${IMAGE_TAG}

ARG IMAGE_ARCHITECTURE

RUN addgroup -g 1000 sylius && \
    adduser -u 1000 -G sylius -h /home/sylius -s /bin/sh -D sylius

RUN USER=sylius && \
    GROUP=sylius && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.5.1/fixuid-0.5.1-linux-${IMAGE_ARCHITECTURE}.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml && \
    sed -i 's/^set -e.*/set -e\nfixuid/g' /usr/local/bin/docker-php-entrypoint && \
    sed -i 's/^user = www-data/;user = www-data/g' /usr/local/etc/php-fpm.d/www.conf && \
    sed -i 's/^group = www-data/;group = www-data/g' /usr/local/etc/php-fpm.d/www.conf

#Fix permissions during creating named volume public-media:/srv/sylius/public/media:rw
RUN mkdir -p /srv/sylius/public/media && chmod 777 -R /srv/sylius

USER sylius:sylius
