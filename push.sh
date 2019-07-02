#!/usr/bin/env bash
echo "Build Images..."
sudo docker login -u $username -p $password registry.cn-hangzhou.aliyuncs.com
sudo docker build -f ./dockerfiles/cpu.Dockerfile --build-arg TF_PACKAGE_VERSION=1.11.0 -t registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-cpu-py3:1.11.0 .
echo "Push Images..."
sudo docker push registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-cpu-py3:latest
sudo docker logout