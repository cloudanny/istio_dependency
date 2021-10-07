FROM docker/ubuntu:latest
ENV OS_ARCH=amd64 \
    HOME=/ \
    OS_FLAVOUR=debian-10 \
    OS_NAME=linux
ARG istioctl_version=1.9.0

RUN install packages curl gzip wget tar
RUN mkdir -p /istioctl/libarary
COPY ISTIO/istio-${istio_version}-${OS_NAME}-${OS_ARCH}.tar.gz /istioctl/library
RUN cd /istioctl/library 
RUN tar -xvzf istio-${istio_version}-${OS_NAME}-${OS_ARCH}.tar.gz && \
    rm -rf istio-${istio_version}-${OS_NAME}-${OS_ARCH}.tar.gz
USER 1000:1000
COPY ${OS_ARCH}/istioctl /usr/local/bin/istioctl
ENTRYPOINT [ "/usr/local/bin/istioctl" ]
