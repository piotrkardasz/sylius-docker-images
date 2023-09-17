ARG IMAGE_NAME
ARG IMAGE_TAG

ARG XDEBUG_VERSION=3.1.2

FROM ${IMAGE_NAME}:${IMAGE_TAG}

ARG XDEBUG_VERSION

RUN set -eux; \
	apk add --no-cache --virtual .build-deps $PHPIZE_DEPS; \
	pecl install xdebug-$XDEBUG_VERSION; \
	docker-php-ext-enable xdebug; \
	apk del .build-deps
