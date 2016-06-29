FROM debian:jessie

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y ruby curl unzip

#consul
ENV CONSUL_VERSION 0.6.4
ENV TILLER_ENV production
RUN curl -SL -o consul.zip https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip  \
   && unzip consul.zip -d /usr/bin && rm consul.zip \
   && chmod +x /usr/bin/consul \
   && mkdir /etc/consul.d

COPY consul-server-config.json /etc/consul.d/consul-server-config.json

RUN gem install tiller && gem install diplomat

COPY tiller /etc/tiller
COPY bootstrap.sh /bootstrap.sh
ENTRYPOINT ["/bootstrap.sh"]
