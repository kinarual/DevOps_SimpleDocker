FROM ubuntu/nginx

WORKDIR /home

COPY ./server/main.c .
COPY ./server/run.sh .

EXPOSE 81/tcp

RUN apt-get update && \
    apt-get install -y gcc libc6-dev libfcgi-dev nginx spawn-fcgi curl && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /home/run.sh
    # gcc -o mini_server main.c -lfcgi && \
    # chmod +x /home/mini_server

RUN mkdir -p /var/cache/nginx /var/log/nginx /etc/nginx/conf.d /var/lib/dpkg /var/lib/nginx/body /var/lib/nginx/proxy /var/lib/nginx/fastcgiv && \
    chown -R nginx:nginx /home /var/cache/nginx /var/log/nginx /etc/nginx /var/lib/dpkg /var/lib/nginx && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

HEALTHCHECK none

USER nginx

CMD ["/home/run.sh"]