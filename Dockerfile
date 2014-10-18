FROM ubuntu:14.04.1
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Kuo-Cheng Yeu <kmd@mikuru.tw>
RUN apt-get -qq update && apt-get -qqy install \ 
    vim \ 
    unzip \ 
    git \ 
    subversion \ 
    wget \ 
    telnet \
    make \
    php5-cli \
    php5-xdebug

RUN mkdir -p /usr/local/bin
ADD https://phar.phpunit.de/phpunit.phar /usr/local/bin/phpunit
RUN chmod 755 /usr/local/bin/phpunit

CMD ["bash"]
