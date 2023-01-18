FROM almalinux:9

# File Author / Maintainer
MAINTAINER Toni Hermoso Pulido <toni.hermoso@crg.eu>

ARG PERLBREW_ROOT=/usr/local/perl
ARG PERL_VERSION=5.36.0
# Enable perl build options. Example: --build-arg PERL_BUILD="--thread --debug"
ARG PERL_BUILD=--thread

# Base Perl and builddep
RUN yum update -y
RUN yum install -y perl yum-utils

RUN dnf config-manager --set-enabled crb
RUN dnf install -y epel-release
RUN yum-builddep -y perl
RUN yum install -y bzip2 zip procps
RUN yum groupinstall -y 'Development Tools'

RUN mkdir -p $PERLBREW_ROOT

RUN bash -c '\curl -L https://install.perlbrew.pl | bash'

ENV PATH $PERLBREW_ROOT/bin:$PATH
ENV PERLBREW_PATH $PERLBREW_ROOT/bin

RUN perlbrew --notest install $PERL_BUILD perl-$PERL_VERSION
RUN perlbrew install-cpanm
RUN bash -c 'source $PERLBREW_ROOT/etc/bashrc'
		
ENV PERLBREW_ROOT $PERLBREW_ROOT
ENV PATH $PERLBREW_ROOT/perls/perl-$PERL_VERSION/bin:$PATH
ENV PERLBREW_PERL perl-$PERL_VERSION
ENV PERLBREW_MANPATH $PELRBREW_ROOT/perls/perl-$PERL_VERSION/man
ENV PERLBREW_SKIP_INIT 1

RUN ln -s $PERLBREW_ROOT/perls/perl-$PERL_VERSION/bin/perl /usr/local/bin/perl

# Clean cache
RUN yum clean all

# Workdir place
RUN mkdir -p /project
WORKDIR /project

#ENTRYPOINT ["./entrypoint.sh"]

