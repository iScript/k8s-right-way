#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#


FROM php:7.2-fpm

MAINTAINER ykq <379395979@qq.com>

# always run apt update when start and after add new source list, then clean up at end.
# RUN set -xe; \
#     apt-get update -yqq && \
#     pecl channel-update pecl.php.net && \
#     apt-get install -yqq \
#       apt-utils \
#       #
#       #--------------------------------------------------------------------------
#       # Mandatory Software's Installation
#       #--------------------------------------------------------------------------
#       #
#       # Mandatory Software's such as ("mcrypt", "pdo_mysql", "libssl-dev", ....)
#       # are installed on the base image 'laradock/php-fpm' image. If you want
#       # to add more Software's or remove existing one, you need to edit the
#       # base image (https://github.com/Laradock/php-fpm).
#       #
#       # next lines are here becase there is no auto build on dockerhub see https://github.com/laradock/laradock/pull/1903#issuecomment-463142846
#       libzip-dev zip unzip && \
#       docker-php-ext-configure zip --with-libzip && \
#       # Install the zip extension
#       docker-php-ext-install zip && \
#       php -m | grep -q 'zip'


#####################################
# Opcache:
#####################################

ARG INSTALL_OPCACHE=true
RUN if [ ${INSTALL_OPCACHE} = true ]; then \
    docker-php-ext-install opcache \
;fi

# Copy opcache configration
COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini


#####################################
# ImageMagick:
#####################################
USER root
ARG INSTALL_IMAGEMAGICK=false
ENV INSTALL_IMAGEMAGICK ${INSTALL_IMAGEMAGICK}
RUN if [ ${INSTALL_IMAGEMAGICK} = true ]; then \
    apt-get update -y && \
    apt-get install -y libmagickwand-dev imagemagick && \
    pecl install imagick && \
    docker-php-ext-enable imagick \
;fi

# php7 没有mysql
# RUN docker-php-ext-install mysql 
# RUN docker-php-ext-install mysqli 
RUN docker-php-ext-install pdo_mysql

#更新apt-get源 使用163的源  ??
# RUN apt-get update -yq && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libz-dev libmemcached-dev 
# RUN docker-php-ext-install gd 






#####################################
# Check PHP version:
#####################################

RUN php -v | head -n 1 | grep -q "PHP 7.2."

#
#--------------------------------------------------------------------------
# Final Touch
#--------------------------------------------------------------------------
#


# 复制
# ADD ./laravel.ini /usr/local/etc/php/conf.d
# ADD ./xlaravel.pool.conf /usr/local/etc/php-fpm.d/

#RUN rm -r /var/lib/apt/lists/*

#RUN usermod -u 1000 www


WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000
