FROM nvidia/cuda:11.2.0-base-ubuntu18.04
LABEL maintainer = "Nemo <nemo.tao@refinedchina.com>" \
      description = "A docker image that combines nvidia/cuda and python3"

COPY prelude/ /prelude/

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y curl build-essential software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get install -y python3.9-dev python3.9-distutils cmake && \
    curl https://bootstrap.pypa.io/get-pip.py | python3.9 && \
    apt-get --purge -y remove curl && \
    rm -rf /var/lib/apt/lists/* && \
    pip install -r /prelude/requirements.txt && \
    unset DEBIAN_FRONTEND