FROM biocorecrg/almalinux-perlbrew:10

# File Author / Maintainer
MAINTAINER Toni Hermoso Pulido <toni.hermoso@crg.eu>
MAINTAINER Luca Cozzuto <lucacozzuto@gmail.com>

ARG PYENV_ROOT=/usr/local/python
ARG PYTHON_VERSION=3.12.11

ENV PYENV_ROOT $PYENV_ROOT

RUN bash -c 'curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash'

ENV PATH $PYENV_ROOT/bin:$PATH
ENV PYTHON_VERSION $PYTHON_VERSION

RUN yum install -y readline readline-devel sqlite sqlite-devel openssl openssl-devel openssl-libs tk-devel xz xz-devel libffi-devel findutils bzip2 bzip2-devel

RUN pyenv install $PYTHON_VERSION

ENV PATH="$PYENV_ROOT/shims:$PYENV_ROOT/versions/$PYTHON_VERSION/bin:$PATH"

RUN ln -s $PYENV_ROOT/versions/$PYTHON_VERSION/bin/python /usr/local/bin/python
RUN ln -s $PYENV_ROOT/versions/$PYTHON_VERSION/bin/python3 /usr/local/bin/python3
RUN ln -s $PYENV_ROOT/versions/$PYTHON_VERSION/bin/pip /usr/local/bin/pip
RUN ln -s $PYENV_ROOT/versions/$PYTHON_VERSION/bin/pip3 /usr/local/bin/pip3

# Clean cache
RUN yum clean all

