#!/usr/bin/env bash

echo "Build Images..."
sudo docker login -u $username -p $password registry.cn-hangzhou.aliyuncs.com
sudo docker build -f ./dockerfiles/gpu.Dockerfile -t registry.cn-hangzhou.aliyuncs.com/geekcloud/pytorch-py3-gpu:0.4.0 .
echo "Push Images..."
sudo docker push registry.cn-hangzhou.aliyuncs.com/geekcloud/pytorch-py3-gpu:0.4.0
sudo docker logout