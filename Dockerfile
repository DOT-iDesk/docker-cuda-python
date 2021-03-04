FROM nvidia/cuda:10.2-cudnn8-runtime-ubuntu18.04
LABEL maintainer = "Nemo <nemo.tao@refinedchina.com>" \
      description = "A docker image that combines nvidia/cuda and python3"

ARG DEBIAN_FRONTEND=noninteractive
COPY prelude/ /prelude/

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y curl build-essential software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get install -y python3.9-dev python3.9-distutils cmake && \
    curl https://bootstrap.pypa.io/get-pip.py | python3.9 && \
    apt-get --purge -y remove curl && \
    rm -rf /var/lib/apt/lists/* && \
    pip install -r /prelude/requirements.txt