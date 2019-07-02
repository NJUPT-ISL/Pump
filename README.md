# Pump
TensorFlow/Pytorch Docker 镜像自动化构建工具

## TensorFlow 镜像列表

| Tensorflow | Python | 构建状态                                                     | GPU/CPU | 镜像名称                                                     |
| ---------- | ------ | ------------------------------------------------------------ | ------- | ------------------------------------------------------------ |
| latest     | 3.5.2  | ![Status](https://www.travis-ci.org/NJUPT-ISL/Pump.svg?branch=master) | GPU     | registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-gpu-py3:latest |
| latest     | 3.5.2  | ![Status](https://www.travis-ci.org/NJUPT-ISL/Pump.svg?branch=tf-cpu) | CPU     | registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-cpu-py3:latest |
| 1.11.0     | 3.5.2  | ![Status](https://www.travis-ci.org/NJUPT-ISL/Pump.svg?branch=tf-gpu-1.11.0) | GPU     | registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-gpu-py3:1.11.0 |
| 1.11.0     | 3.5.2  | ![Status](https://www.travis-ci.org/NJUPT-ISL/Pump.svg?branch=tf-cpu-1.11.0) | CPU     | registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-cpu-py3:1.11.0 |

## Pytorch 镜像列表

| Pytorch | Python | 构建状态 | GPU/CPU | 镜像名称                                                     |
| ---------- | ------ | ------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| latest     | 3.5.2  | ![Status](https://www.travis-ci.org/NJUPT-ISL/Pump.svg?branch=pytorch-gpu) | GPU     | registry.cn-hangzhou.aliyuncs.com/geekcloud/pytorch-py3-gpu:latest |


## 运行容器（用例）

运行 Python 环境：

```shell
$ docker run -it --rm --runtime=nvidia <镜像名称> python
```

使用SSH后台运行：

```shell
$ docker run -it \
  --name tf-pycharm-env \
  --rm --runtime=nvidia \
  <镜像名称>
```
