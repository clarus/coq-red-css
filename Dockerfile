FROM ubuntu
MAINTAINER Guillaume Claret

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y npm
RUN apt-get install -y curl

RUN npm install -g grunt-cli
RUN ln -s /usr/bin/nodejs /usr/bin/node
WORKDIR /root
RUN curl -L https://github.com/twbs/bootstrap/archive/v3.2.0.tar.gz |tar -xz
WORKDIR bootstrap-3.2.0
RUN npm install
ADD . /root/bootstrap-3.2.0/less/
RUN grunt dist

CMD cat dist/css/bootstrap.min.css
