FROM nginx:alpine

MAINTAINER ykq <379395979@qq.com>



ADD nginx.conf /etc/nginx/
# ADD vhost/* /etc/nginx/sites-available/


# 国内网络环境问题
ARG CHANGE_SOURCE=true
RUN if [ ${CHANGE_SOURCE} = true ]; then \
    # 改为阿里云源
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data2


ARG PHP_UPSTREAM_CONTAINER=php-fpm
ARG PHP_UPSTREAM_PORT=9000

# 设置upstream和php通信并删除/etc/nginx/conf.d/default.conf
# RUN echo "upstream php-upstream { server php-svc.default.svc.cluster.local:9000; }" > /etc/nginx/conf.d/upstream.conf \
#     && rm /etc/nginx/conf.d/default.conf
RUN echo "upstream php-upstream { server localhost:9000; }" > /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80 443
