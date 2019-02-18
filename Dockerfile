FROM centos:centos7
MAINTAINER Przemyslaw Ozgo linux@ozgo.info, Marcin Ryzycki marcin@m12.io

RUN yum install -y epel-release && \
  curl -s https://packagecloud.io/install/repositories/varnishcache/varnish60lts/script.rpm.sh | bash && \
  yum update -y && \
  yum install -y varnish && \
  yum clean all

ADD start.sh /start.sh

ENV VCL_CONFIG      /etc/varnish/default.vcl
ENV CACHE_SIZE      1G
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

CMD /start.sh
EXPOSE 80
