ARG UBUNTU_VERSION=18.04
ARG CUDA=10.0
FROM nvidia/cuda${ARCH:+-$ARCH}:${CUDA}-base-ubuntu${UBUNTU_VERSION} as base
ARG CUDNN=7.6.2.24-1
SHELL ["/bin/bash", "-c"]
# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cuda-command-line-tools-${CUDA/./-} \
        cuda-cublas-${CUDA/./-} \
        cuda-cufft-${CUDA/./-} \
        cuda-curand-${CUDA/./-} \
        cuda-cusolver-${CUDA/./-} \
        cuda-cusparse-${CUDA/./-} \
        curl \
        openssh-server \
        libcudnn7=${CUDNN}+cuda${CUDA} \
        libnvinfer5=5.1.5-1+cuda${CUDA} \
        libfreetype6-dev \
        libhdf5-serial-dev \
        libzmq3-dev \
        pkg-config \
        software-properties-common \
        unzip 
RUN mkdir /var/run/sshd \
    && echo 'root:GeekCloud' |chpasswd \
    && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && mkdir /root/.ssh \
    && rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:/usr/local/cuda/lib64:$LD_LIBRARY_PATH
RUN ln -s /usr/local/cuda/lib64/stubs/libcuda.so /usr/local/cuda/lib64/stubs/libcuda.so.1 \
    && echo "/usr/local/cuda/lib64/stubs" > /etc/ld.so.conf.d/z-cuda-stubs.conf \
    && ldconfig
ENV LANG C.UTF-8
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && pip3 --no-cache-dir install --upgrade \
    pip \
    setuptools \
    && ln -s $(which python3) /usr/local/bin/python \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
ARG PACKAGES
RUN pip3 install ${PACKAGES}