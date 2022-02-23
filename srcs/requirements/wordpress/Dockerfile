# setting the OS
FROM	debian:buster

# setting the author
LABEL	elaachac <elaachac@student.42.fr>

# update apt-get
RUN apt-get -y update

# installing curl, php and additional packages
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common \
                        curl mariadb-client

# set up php
COPY ./srcs/www.conf /etc/php/7.3/fpm/pool.d/www.conf


# create ad directoryfor php
RUN mkdir -p /run/php

# download wordpress cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# acquire the rights to execute wp-cli
RUN chmod +x wp-cli.phar

# install the bin file
RUN mv wp-cli.phar /usr/local/bin/wp

# display the logs on stdout
RUN     ln -sf /dev/stdout /var/log/php7.3-fpm.access.log \
        && ln -sf /dev/stderr /var/log/php7.3-fpm.log

# add the script we need to set up wordpress
COPY ./srcs/wp_script.sh .

# install our wordpress and launch php
CMD bash wp_script.sh && php-fpm7.3 -F -R