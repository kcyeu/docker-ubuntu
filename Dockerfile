FROM ubuntu:trusty
MAINTAINER Kuo-Cheng Yeu <kmd@mikuru.tw>

ENV DEBIAN_FRONTEND noninteractive

# Silently install basic packages
RUN apt-get -qq update && apt-get -qqy install \ 
    vim \ 
    unzip \ 
    git \ 
    subversion \ 
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

# composer
ADD http://getcomposer.org/composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer

# phpunit
ADD https://phar.phpunit.de/phpunit.phar /usr/local/bin/phpunit
RUN chmod 755 /usr/local/bin/phpunit

# phpcs
RUN pear install PHP_CodeSniffer

# pdepend, dependency of phpmd
RUN pear channel-discover pear.pdepend.org
RUN pear install pdepend/PHP_Depend

# phpmd
RUN pear channel-discover pear.phpmd.org
RUN pear install phpmd/PHP_PMD

# fpm
RUN gem install fpm

# locale-gen
RUN locale-gen zh_TW.UTF-8 en_US.UTF-8

CMD ["bash"]

