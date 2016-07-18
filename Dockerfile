FROM debian:jessie

MAINTAINER xazrad

RUN apt-get update \ 
    && apt-get install -y \
    build-essential \
    nginx \
    python2.7 \
    python-pip \
    python2.7-dev \
    libpq-dev \
    libpcre3 \
    libpcre3-dev \
    supervisor \
    && pip install uwsgi \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \ 
    && chown -R www-data:www-data /var/lib/nginx \ 
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 


EXPOSE 80

WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]
