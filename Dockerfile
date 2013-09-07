# DOCKER-VERSION 0.5.3

FROM paulczar/chef-client

MAINTAINER Paul Czarkowski "paul@paulcz.net"

RUN apt-get -y update

ADD . /chef

RUN cd /chef && /opt/chef/embedded/bin/berks install --path /chef/cookbooks

RUN chef-solo -c /chef/solo.rb -j /chef/solo.json

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

CMD ["nginx"]