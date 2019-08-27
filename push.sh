#!/usr/bin/env bash

echo "Build Images..."
sudo docker login -u $username -p $password registry.cn-hangzhou.aliyuncs.com
sudo docker build -f ./dockerfiles/gpu.Dockerfile --build-arg TF_PACKAGE_VERSION=1.14.0 --build-arg TF_PACKAGE=tensorflow-gpu -t registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-gpu-py3:1.14.0 .
echo "Push Images..."
sudo docker push registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-gpu-py3:1.14.0
sudo docker logout
