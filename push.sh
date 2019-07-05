#!/usr/bin/env bash

echo "Build Images..."
sudo docker login -u $username -p $password registry.cn-hangzhou.aliyuncs.com
sudo docker build -f ./dockerfiles/gpu.Dockerfile --build-arg TF_PACKAGE_VERSION=2.0.0b1 -t registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-gpu-py3:2.0.0b1 .
echo "Push Images..."
sudo docker push registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-gpu-py3:2.0.0b1
sudo docker logout
