FROM php:7.2-fpm
 
MAINTAINER Đinh Trung <trungdn.dev@gmail.com>

# Update system and install dependencies
#RUN apt-get update \
    #&& apt-get install -y --no-install-recommends \
        #libfreetype6-dev \
        #libjpeg62-turbo-dev \
        #libpng-dev \
        #curl \
        #git \
        #libjpeg-dev \
        #libgif-dev \
        #libmcrypt-dev \
    #&& docker-php-ext-install mbstring \
    #&& docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqli \
    #&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  \
    #&& docker-php-ext-install -j$(nproc) gd \
    #&& pecl install redis mcrypt-1.0.1 \
    #&& docker-php-ext-enable redis mcrypt \
    #&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    #&& composer --version

# Clear package lists
#RUN rm -rf /var/lib/apt/lists/*

COPY php.ini /usr/local/etc/php/conf.d/php.ini
COPY ./sources /var/www/html

# Permission
#RUN usermod -u 1000 www-data

# Expose port
EXPOSE 9000

# Run php-fpm
CMD ["php-fpm"]

