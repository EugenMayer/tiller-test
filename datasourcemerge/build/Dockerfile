FROM debian:jessie

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y ruby

RUN bash -c -l "gem install tiller" && bash -c -l "gem install diplomat"

COPY tiller /etc/tiller

ENTRYPOINT "tiller"
CMD ['-e production']
