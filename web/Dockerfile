FROM nginx

LABEL maintainer="zgchuck@gmail.com"

COPY ./web/entrypoint.sh /
COPY ./web/default.conf /etc/nginx/conf.d/
COPY ./web/index.html /usr/share/nginx/html/

RUN \
# install packages
    apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y vim less && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x /entrypoint.sh

EXPOSE 80 443

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]
