FROM krosh961/apache

MAINTAINER Sergey Kardashov <krosh961@yandex.ru>

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
    # install composer
    cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && \
    #clear cache
    rm -rf /var/cache/apk/*  
    
