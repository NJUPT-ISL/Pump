# tf-image-pusher
TensorFlow Docker 镜像自动化构建工具

构建状态：  ![Status](https://www.travis-ci.org/njupt-iot-sig/tf-image-pusher#)

## 镜像列表

| Tensorflow | Python | GPU/CPU | 镜像名称                                                     |
| ---------- | ------ | ------- | ------------------------------------------------------------ |
| latest     | 3      | GPU     | registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-gpu-py3:latest |
| 1.11.0     | 3      | GPU     | registry.cn-hangzhou.aliyuncs.com/geekcloud/tf-gpu-py3:latest |



## 运行容器

运行 Python 环境：

```shell
$ docker run -it --rm --runtime=nvidia tensorflow/tensorflow:latest-gpu-py3 python
```

使用SSH后台运行：

```shell
$ docker run -it \
  --name tf-pycharm-env\ 
  --rm --runtime=nvidia \
  tensorflow/tensorflow:latest-gpu-py3
```

