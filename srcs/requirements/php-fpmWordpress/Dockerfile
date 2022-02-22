# setting the OS
FROM	debian:buster

# setting the author
LABEL	elaachac <elaachac@student.42.fr>

# update apt-get
RUN apt-get -y update

# installing php and additional packages
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common

# set up php
COPY ./srcs/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# create ad directoryfor php
RUN mkdir -p /run/php

# display the logs on stdout
RUN     ln -sf /dev/stdout /var/log/php7.3-fpm.access.log \
        && ln -sf /dev/stderr /var/log/php7.3-fpm.log

# launch php
CMD php-fpm7.3 -F -R