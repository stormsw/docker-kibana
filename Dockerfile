FROM alpine:3.1
MAINTAINER Alexander Varchenko <alexander.varchenko@gmail.com>
#latest is 4.1.0-snapshot-linux-x64
#https://download.elastic.co/kibana/kibana/kibana-3.1.2.tar.gz
ENV KIBANA_VERSION 3.1.2
RUN apk --update add curl && \
    mkdir /opt && \
    curl -s https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz | tar zx -C /opt && \
    apk add nodejs && \
    rm -rf /opt/kibana-${KIBANA_VERSION}/node && \
    mkdir -p /opt/kibana-${KIBANA_VERSION}/node/bin && \
    ln -sf /usr/bin/node /opt/kibana-${KIBANA_VERSION}/node/bin/node && \
    apk del curl
WORKDIR /opt/kibana-${KIBANA_VERSION}
ADD ./server.js /opt/kibana-${KIBANA_VERSION}/
ADD ./run.sh /run.sh
EXPOSE 5601
ENTRYPOINT /run.sh
