FROM krosh961/apache-alpine3.7

MAINTAINER Sergey Kardashov <krosh961@yandex.ru>

LABEL org.label-schema.name="Apache-php7-alpine3.7" \
      org.label-schema.description="This is a micro docker container based on Alpine 3.7, Apache 2.4 and php7" \
      org.label-schema.url="https://hub.docker.com/r/krosh961/alpine-apache-php7/" \
      org.label-schema.vcs-url="https://github.com/krosh961/apache-php7-docker" 


COPY root/. /

RUN  apk update && apk upgrade && \
    printf "Build of krosh961/alpine-apache-php7, date: %s\n"  `date -u +"%Y-%m-%dT%H:%M:%SZ"` >> /etc/BUILD && \
    apk add libressl && \
    apk add curl openssl && \
    apk add git nano && \
    apk add php7 php7-apache2 php7-openssl php7-mbstring && \
    apk add php7-apcu php7-intl php7-mcrypt php7-json php7-gd php7-curl && \
    apk add php7-mysqlnd php7-mysqli php7-pdo_mysql php7-pdo php7-phar && \
    apk add php7-imagick@testing php7-ctype && \
    apk add php7-bz2 php7-calendar php7-dom php7-gettext php7-imap php7-exif && \
    apk add php7-iconv php7-session php7-shmop php7-sockets php7-xml php7-xmlreader php7-xmlrpc && \
    apk add php7-zip php7-zlib && \
    apk add php7-fileinfo php7-tokenizer php7-xmlwriter && \
    # install composer
    cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && \
    #clear cache
    rm -rf /var/cache/apk/*  
    
