FROM registry.cn-beijing.aliyuncs.com/jiaofuyun/alinode:3.8.4-alpine
LABEL Name=node-rdkafka Version=2.3.1

RUN apk --no-cache add \
      # ca-certificates \
      lz4-dev \
      musl-dev \
      cyrus-sasl-dev \
      openssl-dev

ENV NODE_RD_KAFKA_VERSION 2.3.1

RUN apk add --no-cache --virtual .build-deps \
      g++ \
      make \
      python \
      gcc \
      zlib-dev \
      libc-dev \
      bsd-compat-headers \
      py-setuptools \
      bash \
      && mkdir -p /var/app \
      && cd /var/app \
      && npm install node-rdkafka@${NODE_RD_KAFKA_VERSION} --production --registry=https://registry.npm.taobao.org \
      && apk del .build-deps