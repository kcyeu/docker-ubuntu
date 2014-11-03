FROM ubuntu:14.04.1
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Kuo-Cheng Yeu <kmd@mikuru.tw>

#ADD sources.list /etc/apt/sources.list

# Silently install basic packages
RUN apt-get -qq update && apt-get -qqy install \ 
    vim \ 
    unzip \ 
    git \ 
    subversion \ 
    wget \ 
    telnet \
    make \
    php5-cli \
    php5-xdebug \
    php5-gd \
    php-gettext \
    php-pear \
    doxygen

# phpunit
RUN mkdir -p /usr/local/bin
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

CMD ["bash"]

