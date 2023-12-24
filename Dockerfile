FROM debian:stretch

RUN apt-get update && \
    apt-get install -y git gcc make libpcre3-dev libssl-dev wget && \
    mkdir -p /home/nginx-rtmp-module && \
    git clone https://github.com/arut/nginx-rtmp-module /home/nginx-rtmp-module && \
    mkdir -p /home/nginx && \
    cd /home/nginx && \
    wget http://nginx.org/download/nginx-1.18.0.tar.gz && \
    tar zxpvf nginx-1.18.0.tar.gz && \
    cd /home/nginx/nginx-1.18.0 && \
    ./configure --add-module=/home/nginx-rtmp-module/ --with-http_ssl_module --prefix=/usr/local/nginx-streaming/ && \
    make && make install && \
    mkdir -p /var/www/html /var/nginx-streaming /var/log/nginx && \
    cp /home/nginx-rtmp-module/stat.xsl /var/nginx-streaming/ && \
    rm -rf /home/nginx /var/lib/apt/lists/*

ADD nginx/nginx.conf /usr/local/nginx-streaming/conf/nginx.conf

EXPOSE 80
EXPOSE 1935
