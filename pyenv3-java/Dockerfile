FROM biocorecrg/almalinux-perlbrew-pyenv3:9

# File Author / Maintainer
MAINTAINER Toni Hermoso Pulido <toni.hermoso@crg.eu>
MAINTAINER Luca Cozzuto <lucacozzuto@gmail.com> 

ARG JAVA_VERSION=17
ARG MAVEN_VERSION=3.8.7

ENV JAVA_HOME /usr/lib/jvm/java-openjdk

RUN yum update -y
# Install Java
RUN yum install -y java-$JAVA_VERSION-openjdk java-$JAVA_VERSION-openjdk-devel
# Install maven

RUN cd /usr/local; curl --fail --silent --show-error --location --remote-name http://apache.rediris.es//maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz

RUN cd /usr/local; tar zxf apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN cd /usr/local; rm apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN cd /usr/local; ln -s /usr/local/apache-maven-$MAVEN_VERSION/bin/mvn /usr/local/bin/mvn

# Clean cache
RUN yum clean all

