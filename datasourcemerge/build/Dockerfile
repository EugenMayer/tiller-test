FROM debian:jessie

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y ruby

RUN gem install tiller && gem install diplomat

COPY tiller /etc/tiller

ENTRYPOINT ["tiller","-d","-v"]
CMD ["-e","production"]