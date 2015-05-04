FROM ubuntu:trusty
MAINTAINER Kuo-Cheng Yeu <kmd@mikuru.tw>

ENV DEBIAN_FRONTEND noninteractive

# Silently install basic packages
RUN apt-get -qq update && apt-get -qqy install \ 
    vim \ 
    unzip \ 
    git \ 
    curl \
    wget \ 
    telnet \
    make \
    php5-cli \
    php5-curl \
    php5-xdebug \
    php5-gd \
    php-gettext \
    php-pear \
    ruby-dev \
    doxygen \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& mkdir -p /usr/local/bin

# add via phar
ADD http://getcomposer.org/composer.phar /usr/local/bin/composer
ADD https://phar.phpunit.de/phpunit.phar /usr/local/bin/phpunit
ADD https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar /usr/local/bin/phpcs
#ADD http://static.pdepend.org/php/latest/pdepend.phar /usr/local/bin/pdepend
ADD http://static.phpmd.org/php/latest/phpmd.phar /usr/local/bin/phpmd

RUN chmod +x /usr/local/bin/*

# fpm
RUN gem install fpm

# locale-gen
RUN locale-gen zh_TW.UTF-8 en_US.UTF-8

CMD ["bash"]

