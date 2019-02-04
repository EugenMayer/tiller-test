FROM debian:stretch

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y ruby git

COPY tiller /etc/tiller
COPY entrypoint.sh /entrypoint.sh

#RUN gem install tiller
RUN cd /tmp \
 && git clone https://github.com/markround/tiller --branch develop \
 && cd tiller \
 && git branch \
 && gem build tiller.gemspec \
 && gem install *.gem

RUN  chmod +x /entrypoint.sh


ENV tiller_test_value=1

ENTRYPOINT ["/entrypoint.sh"]
