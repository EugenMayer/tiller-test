FROM debian:stretch

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y ruby git

COPY tiller /etc/tiller
COPY entrypoint.sh /entrypoint.sh

RUN cd / \
 && git clone https://github.com/markround/tiller --branch develop tiller_source \
 && cd tiller_source \
 && git branch \
 && gem build tiller.gemspec \
 && mv tiller-*.gem tiller-source.gem

RUN  chmod +x /entrypoint.sh

ENV tiller_test_value=1
ENTRYPOINT ["/entrypoint.sh"]

