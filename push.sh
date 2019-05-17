#!/usr/bin/env bash

echo "Build Images..."
sudo docker login -u $username -p $password registry.cn-hangzhou.aliyuncs.com
sudo docker build -f ./dockerfiles/gpu.Dockerfile -t registry.cn-hangzhou.aliyuncs.com/geekcloud/pytorch-py3-gpu:latest .
echo "Push Images..."
sudo docker push registry.cn-hangzhou.aliyuncs.com/geekcloud/pytorch-gpu:latest
sudo docker logout
