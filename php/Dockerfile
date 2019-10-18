FROM php:7.2-fpm
 
MAINTAINER Đinh Trung <trungdn.dev@gmail.com>

# Update system and install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       curl \
       nano

# Common php-ext and requirements
RUN apt-get install -y --no-install-recommends libpq-dev libz-dev \
    && docker-php-ext-install pdo

#####################################
# GD:
#####################################

ARG INSTALL_GD=false
RUN if [ ${INSTALL_GD} = true ]; then \
    apt-get install -y --no-install-recommends libjpeg-dev libpng-dev libfreetype6-dev \
        && docker-php-ext-configure gd \
            --enable-gd-native-ttf \
            --with-jpeg-dir=/usr/lib \
            --with-freetype-dir=/usr/include/freetype2 \
        && docker-php-ext-install gd \
;fi

#####################################
# MBSTRING:
#####################################

ARG INSTALL_MBSTRING=false
RUN if [ ${INSTALL_MBSTRING} = true ]; then \
    docker-php-ext-install mbstring \
;fi

#####################################
# MCRYPT:
#####################################

ARG INSTALL_MCRYPT=false
RUN if [ ${INSTALL_MCRYPT} = true ]; then \
    apt-get install -y libmcrypt-dev \
    && pecl install mcrypt-1.0.1 \
    && docker-php-ext-enable mcrypt \
;fi

#####################################
# PDO_MYSQL:
#####################################

ARG INSTALL_PDO_MYSQL=false
RUN if [ ${INSTALL_PDO_MYSQL} = true ]; then \
    docker-php-ext-install pdo_mysql \
;fi

#####################################
# PDO_POSTGRESQL:
#####################################

ARG INSTALL_PDO_POSTGRESQL=false
RUN if [ ${INSTALL_PDO_POSTGRESQL} = true ]; then \
    docker-php-ext-install pdo_pgsql \
;fi

#####################################
# MYSQLi:
#####################################

ARG INSTALL_MYSQLI=false
RUN if [ ${INSTALL_MYSQLI} = true ]; then \
    docker-php-ext-install mysqli \
;fi

#####################################
# COMPOSER:
#####################################

ARG INSTALL_COMPOSER=false
RUN if [ ${INSTALL_COMPOSER} = true ]; then \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
;fi

# Clear package lists
RUN rm -rf /var/lib/apt/lists/*

# Mapping php.ini file
COPY ./php.ini /usr/local/etc/php/conf.d/php.ini

# Permissions
RUN chown -R root:www-data /var/www/html
RUN chmod u+rwx,g+rx,o+rx /var/www/html
RUN find /var/www/html -type d -exec chmod u+rwx,g+rx,o+rx {} +
RUN find /var/www/html -type f -exec chmod u+rw,g+rw,o+r {} +

# Expose port
EXPOSE 9000

# Run php-fpm
CMD ["php-fpm"]

