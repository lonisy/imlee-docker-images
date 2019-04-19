FROM debian:jessie

MAINTAINER ImLee <lonisy@163.com>

# COPY ./docker/sources.list /etc/apt/sources.list
RUN	apt-get update && \
	apt-get install -y --no-install-recommends \
	build-essential \
	libtool \
	automake

WORKDIR /kids

COPY . /kids
RUN ./autogen.sh && ./configure && make

EXPOSE :3388

CMD ["src/kids", "-c", "/kids/debian/kids.conf"]
