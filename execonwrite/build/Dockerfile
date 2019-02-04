FROM debian:stretch

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y ruby

COPY tiller /etc/tiller
COPY entrypoint.sh /entrypoint.sh

RUN gem install tiller \
  && chmod +x /entrypoint.sh

ENV tiller_test_value=1

ENTRYPOINT ["/entrypoint.sh"]
