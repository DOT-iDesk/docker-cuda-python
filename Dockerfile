FROM nvidia/cuda:11.2.0-base-ubuntu18.04
LABEL maintainer = "Nemo <nemo.tao@refinedchina.com>" \
      description = "A docker image that combines nvidia/cuda and python3"

COPY python_prelude.txt /

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends curl wget build-essential python3-dev python3-distutils cmake -y && \
    curl https://bootstrap.pypa.io/get-pip.py | python3 && \
    apt-get --purge remove curl -y && \
    rm -rf /var/lib/apt/lists/* && \
    pip install -r /python_prelude.txt